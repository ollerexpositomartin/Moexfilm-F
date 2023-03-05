import 'package:flutter/material.dart';
import 'package:moexfilm/config/app_theme.dart';
import 'config/router.dart';

class MoexfilmApp extends StatelessWidget {
  const MoexfilmApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      theme: AppTheme(Brightness.light).themeData,
      darkTheme: AppTheme(Brightness.dark).themeData,
    );
  }
}
