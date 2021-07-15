import 'package:flutter/material.dart';

import '../../../common/models/catalog/FrameSizeModel.dart';

import '../../app/AppData.dart';
import '../../resources/AppDimens.dart';
import '../../resources/AppColors.dart';
import '../../resources/AppStyles.dart';
import '../../resources/AppValues.dart';
import '../core/BaseStatelessWidget.dart';


/*
 * Widget that displays a single frame size item
 */
class FrameSizeWidget extends BaseStatelessWidget {
  final FrameSizeModel frame;
  final bool selected;

  const FrameSizeWidget({@required this.frame, this.selected = false, Key key})
      : assert(frame != null),
        super(key: key);

  @override
  Widget buildWidgetContents(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: FrameSizeWidgetDimens.ITEM_HEIGHT,
      padding: EdgeInsets.symmetric(horizontal: 4 * AppDimens.MID_SPACING),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Visibility(visible: this.selected, child: Icon(Icons.check, color: AppColors.primaryDark,)),
          Text(this.frame.toString(), maxLines: AppValues.ONE_LINE, style: AppStyles.body,),
        ],
      ),
    );
  }
}

abstract class FrameSizeWidgetDimens {
  static const ITEM_HEIGHT = 30.0;
}