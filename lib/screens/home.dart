import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ip_info/bloc/ip_info_bloc.dart';
import 'package:ip_info/consts/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/appbar.dart';
import '../widgets/error_card.dart';
import '../widgets/ip_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _reload() {
    HapticFeedback.lightImpact();
    context.read<IpInfoBloc>().add(IpInfoFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: appTitle.toUpperCase(),
      ),
      body: BlocBuilder<IpInfoBloc, IpInfoState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          Widget body = const Center(
            child: CircularProgressIndicator(
              color: refreshColor,
            ),
          );

          switch (state.status) {
            case IpInfoStatus.success:
              body = IpCard(ipInfo: state.ipInfo);
              break;
            case IpInfoStatus.failure:
              body = const ErrorCard(errorMsg: "Could not fetch IP info");
              break;
            default:
              break;
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
