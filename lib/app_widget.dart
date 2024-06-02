import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget{
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      supportedLocales: const [
        Locale('id', 'ID')
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: const Locale('id', 'ID'),
      title: 'MyBCA',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0053AE)),
        useMaterial3: true,
      ),
      routerConfig: Modular.routerConfig,
      builder: Asuka.builder,
      /*builder: (context, widget) => MultiBlocProvider(
        providers: [
          BlocProvider<HomeProvider>(
            create: (BuildContext context) => HomeProvider(),
          ),
          BlocProvider<TestBloc>(
            create: (BuildContext context) => TestBloc(),
          ),
        ],
        child: const Test(),
      ),*/
    ); //added by extension
  }
}
