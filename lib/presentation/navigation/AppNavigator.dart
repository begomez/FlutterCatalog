import 'package:flutter/material.dart';
import 'package:flutter_catalog/common/models/catalog/BikeModel.dart';
import '../screens/detail/BikeScreen.dart';


/*
 * Class that centralizes route creation and page navigation
 */
abstract class AppNavigator {

  static Future<void> toCatalog(BuildContext cntxt) async {
    return await Navigator.of(cntxt).pushReplacementNamed(Routes.catalog);
  }

  static Future<void> toFilter(BuildContext cntxt) async {
    return await Navigator.of(cntxt).pushNamed(Routes.filter);
  }

  static Future<void> toDetail(BuildContext cntxt, BikeModel item) async {
    return await Navigator.of(cntxt).push(
      MaterialPageRoute(builder: (cntxt) => BikeScreen(item))
    );
  }
}

/*
 * Enumeration of possible route paths
 */
abstract class Routes {
  static final String init = "/";
  static final String splash = "/splash";
  static final String catalog = "/catalog";
  static final String filter = "/filter";
}

