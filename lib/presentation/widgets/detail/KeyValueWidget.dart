import 'package:flutter/material.dart';

import '../../resources/AppStyles.dart';
import '../../resources/AppValues.dart';
import '../../resources/AppDimens.dart';
import '../core/BaseStatelessWidget.dart';


/*
 * Widget displaying key-value pair of strings
 */
class KeyValueWidget extends BaseStatelessWidget {
  final String strKey;
  final String strValue;

  const KeyValueWidget({this.strKey = "", this.strValue = ""}) : super();

  @override
  Widget buildWidgetContents(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: AppDimens.MID_SPACING),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(this.strKey, style: AppStyles.title, maxLines: AppValues.ONE_LINE,),
          Text(this.strValue, style: AppStyles.subtitle, maxLines: AppValues.ONE_LINE,)
        ],
      )
    );
  }
}