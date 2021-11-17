import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/helpers/routes_helper.dart';
import 'package:flutter_app/providers/app_provider.dart';
import 'package:flutter_app/providers/players_provider.dart';
import 'package:flutter_app/providers/team_provider.dart';
import 'package:flutter_app/themes/colors.dart';
import 'package:flutter_app/themes/themes.dart';
import 'package:flutter_app/utils/constants.dart';
import 'package:provider/provider.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = new MyHttpOverrides();

  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: POColors.white));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => AppProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => TeamProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => PlayersProvider(),
          ),
        ],
        child: MaterialApp(
          title: 'TestApp',
          theme: POThemes.getLightTheme(),
          initialRoute: Constants.route_wmain,
          onGenerateRoute: (settings) {
            return RoutesHelper.generateRoute(settings);
          },
          debugShowCheckedModeBanner: false,
        ));
  }
}
