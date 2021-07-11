import 'package:flutter/material.dart';

import '../../resources/AppColors.dart';


/*
 * Utils for dialogs, toast, overlays...
 */
abstract class WidgetFactory {

  static Widget buildBtn(
      {Color color = AppColors.accent,
      @required String text,
      @required Function callback,
      @required TextStyle style}) {
    return Container(
      width: double.maxFinite,
      child: MaterialButton(
          color: color,
          child: Text(
            text,
            style: style,
          ),
          onPressed: callback.call),
    );
  }
}
