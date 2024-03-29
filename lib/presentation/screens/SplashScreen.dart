import 'package:flutter/material.dart';

import '../widgets/SplashWidget.dart';
import '../navigation/AppNavigator.dart';
import 'core/BaseStatelessScreen.dart';

/*
 * Initial/launch screen
 */
class SplashScreen extends BaseStatelessScreen {
  const SplashScreen({String title = "", Key key})
      : super(title: title, key: key);

  @override
  Widget buildScreenContents(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      this._navigateDelayed(context);
    });

    return SplashWidget();
  }

  Future<void> _navigateDelayed(BuildContext cntxt) async {
    final int DELAY_IN_SECS = 2;

    return await Future.delayed(Duration(seconds: DELAY_IN_SECS))
        .then((value) async => await AppNavigator.toCatalog(cntxt));
  }
}
