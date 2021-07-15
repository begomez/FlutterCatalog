import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../navigation/AppNavigator.dart';
import '../resources/AppStyles.dart';
import '../screens/catalog/CatalogScreen.dart';
import '../screens/filter/FilterScreen.dart';
import '../screens/SplashScreen.dart';
import '../utils/AppLocalizations.dart';
import 'AppData.dart';


/*
 * Widget containing main app
 */
class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppData(
      child: MaterialApp(
          showPerformanceOverlay: false,
          debugShowCheckedModeBanner: false,
          title: "BuyCycle",
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
            Routes.catalog: (cntxt) => CatalogScreen(title: ""),
            Routes.filter: (cntxt) => FilterScreen(title: "")
          }
        ),
    );
  }
}
