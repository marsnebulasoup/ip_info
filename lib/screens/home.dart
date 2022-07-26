import 'package:ip_info/consts/constants.dart';
import 'package:ip_info/models/ip_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/appbar.dart';
import '../widgets/error_card.dart';
import '../widgets/ip_card.dart';
import '../services/ip_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<IpInfo?> _ipInfo;

  @override
  void initState() {
    super.initState();
    _ipInfo = IpProvider.fetchIpInfo();
  }

  void _reload() {
    HapticFeedback.lightImpact();
    setState(() {
      _ipInfo = IpProvider.fetchIpInfo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "IP INFO",
      ),
      body: FutureBuilder<IpInfo?>(
        future: _ipInfo,
        builder: (context, snapshot) {
          Widget body = const Center(
            child: CircularProgressIndicator(
              color: refreshColor,
            ),
          );

          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              body = IpCard(ipInfo: snapshot.data!);
            } else if (snapshot.hasError) {
              body = const ErrorCard(errorMsg: "Could not fetch IP info");
            }
          }

          return body;
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: refreshColor,
        onPressed: _reload,
        tooltip: 'Reload',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
