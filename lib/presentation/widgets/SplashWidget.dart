import 'dart:math';

import 'package:flutter/material.dart';

import '../resources/AppColors.dart';
import 'core/BaseStatelessWidget.dart';

/*
 * Widget displayed when launching app
 */
class SplashWidget extends BaseStatelessWidget {
  const SplashWidget({Key key}) : super(key: key);

  @override
  Widget buildWidgetContents(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: SweepGradient(
          center: FractionalOffset.center,
          startAngle: 0.0,
          endAngle: pi * 2,
          colors: [
            AppColors.primary,
            AppColors.primaryDark, // green
            AppColors.accent, // blue
            AppColors.primaryDark, // green
            AppColors.primary,
          ],
          stops: <double>[0.0, 0.25, 0.5, 0.75, 1.0],
          transform: GradientRotation(pi / 4),
        ),
      ),
      child: Image.asset("assets/images/splash.png"),
    );
  }
}
