import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:valbury/routes/app_routes.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Valbury',
        initialRoute: AppRoutes.splash,
        getPages: AppRoutes.pages,
        builder: (context, child) {
          SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
          return Scaffold(
            backgroundColor: Colors.white,
            body: child!,
          );
        });
  }
}
