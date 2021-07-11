import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../navigation/AppNavigator.dart';
import '../resources/AppStyles.dart';
import '../screens/HomeScreen.dart';
import '../screens/SplashScreen.dart';
import '../utils/AppLocalizations.dart';


/*
 * Widget containing main app
 */
class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        showPerformanceOverlay: false,
        debugShowCheckedModeBanner: false,
        title: "MainApp",
        theme: AppStyles.appTheme,
        home: SplashScreen(
          title: "",
        ),
        supportedLocales:
            LangCodes.values.map((LangCodes e) => Locale(e.toCode())).toList(),
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        routes: {
          Routes.splash: (cntxt) => SplashScreen(title: ""),
          Routes.home: (cntxt) => HomeScreen(title: "")
        }
      );
  }
}