import 'package:flutter/material.dart';


/*
 * Class that centralizes route creation and page navigation
 */
abstract class AppNavigator {

  static void closeAll(BuildContext cntxt) {
    return Navigator.of(cntxt).popUntil((route) => route.settings.name == Routes.login);
  }

  static Future<void> toHome(BuildContext cntxt) async {
    return await Navigator.of(cntxt).pushReplacementNamed(Routes.home);
  }
}

/*
 * Enumeration of possible route paths
 */
abstract class Routes {
  static final String init = "/";
  static final String splash = "/splash";
  static final String login = "/login";
  static final String home = "/home";
}

