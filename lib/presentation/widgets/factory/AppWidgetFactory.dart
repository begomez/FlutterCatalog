import 'package:flutter/material.dart';

import '../../utils/AppLocalizations.dart';

import '../../resources/AppValues.dart';
import '../../resources/AppDimens.dart';
import '../../resources/AppColors.dart';

/*
 * Utils for dialogs, toast, overlays...
 */
abstract class AppWidgetFactory {

  /*
   * Shows a bottom card  
   */
  static void showBottomInfo(
      {@required BuildContext context,
      @required Widget child,
      Color color = AppColors.white,
      double height = 300.0,
      double radius = 0.0,
      Function onClose}) {
    assert(context != null);
    assert(child != null);

    showModalBottomSheet<void>(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Container(
            height: height,
            padding: EdgeInsets.all(AppDimens.MID_SPACING),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(radius),
            ),
            child: Column(
              children: [
                IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    onClose?.call();
                  },
                ),
                Expanded(child: child) //elev
              ], //children
            ), //center
          );
        } //builder
      ); //show
  }

  static Future<bool> notAvailable(BuildContext cntxt) {
    return _buildDialog(
      cntxt,
      () {
        Navigator.of(cntxt).pop();
      },
      strTitle: AppLocalizations.of(cntxt).translate("app_name"),
      strContent: AppLocalizations.of(cntxt).translate("msg_not_available"),
      strAction: AppLocalizations.of(cntxt).translate("action_accept")
    );
  }

  static Future<bool> _buildDialog(BuildContext cntxt, Function action, {String strTitle, String strContent, String strAction}) {
    return showDialog<bool>(
      context: cntxt,
      builder: (context) {
        return AlertDialog(
          title: Text(strTitle),
          content: Text(strContent),
          actions: [
            ElevatedButton(onPressed: () {
              action?.call();
            }, child: Text(strAction, maxLines: AppValues.ONE_LINE,))
          ],
        );
      }
    ); 
  }

  /*
   * Builds an action btn
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
