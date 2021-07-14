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
      height: FrameSizeWidgetDimens.ITEM_HEIGHT,
      margin: EdgeInsets.only(left: AppDimens.BIG_SPACING),
      //padding: EdgeInsets.all(AppDimens.SMALL_SPACING),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(this.frame.toString(), maxLines: AppValues.ONE_LINE, style: AppStyles.body,),
          Visibility(visible: this.selected, child: Icon(Icons.check, color: AppColors.primaryDark,))
        ],
      ),
    );
  }
}

abstract class FrameSizeWidgetDimens {
  static const ITEM_HEIGHT = 30.0;
}