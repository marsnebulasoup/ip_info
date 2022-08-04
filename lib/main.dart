import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ip_info/bloc/ip_info_bloc.dart';
import 'package:ip_info/main_observable.dart';
import 'package:ip_info_api/ip_info.dart';
import 'consts/constants.dart';
import 'screens/home.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(
      MyApp(ipRepo: IpInfoApiClient()),
    ),
    blocObserver: MainObserver(),
  );
}

class MyApp extends StatelessWidget {
  final IpInfoApiClient ipRepo;
  const MyApp({super.key, required this.ipRepo});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return RepositoryProvider.value(
      value: ipRepo,
      child: MaterialApp(
        title: appTitle,
        theme: ThemeData(
          scaffoldBackgroundColor: pageBackgroundColor,
          fontFamily: "OverpassMono",
        ),
        home: BlocProvider(
          create: (_) =>
              IpInfoBloc(ipInfoApiClient: ipRepo)..add(IpInfoFetched()),
          child: const HomePage(title: appTitle),
        ),
      ),
    );
  }
}
