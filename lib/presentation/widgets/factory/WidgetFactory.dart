import 'package:flutter/material.dart';

import '../../resources/AppDimens.dart';
import '../../resources/AppColors.dart';


/*
 * Utils for dialogs, toast, overlays...
 */
abstract class WidgetFactory {

  static void showBottomInfo(
      BuildContext context,
      Widget child, {
        Color color = AppColors.white,
        double height = 300.0,
        double radius = 0.0,
        Function onClose
      }) {

    showModalBottomSheet<void>(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.all(AppDimens.MID_SPACING),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(radius),
            ),
            height: height,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    onClose?.call();
                  },
                )//elev
              ],//children
            ),//center
          );//container
        }//builder
    );//show
  }

  /*
   * Build action btn
   */
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
