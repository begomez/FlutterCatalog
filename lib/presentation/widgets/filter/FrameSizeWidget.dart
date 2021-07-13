import 'package:flutter/material.dart';
import 'package:flutter_catalog/presentation/resources/AppDimens.dart';

import '../../../common/models/catalog/FrameSizeModel.dart';

import '../../app/AppData.dart';
import '../../resources/AppColors.dart';
import '../../resources/AppStyles.dart';
import '../../resources/AppValues.dart';
import '../core/BaseStatelessWidget.dart';


/*
 * Widget that allows user selecting a frame size item
 */
class FrameSizeWidget extends BaseStatelessWidget {
  final FrameSizeModel frame;
  final bool selected;

  const FrameSizeWidget({@required this.frame, this.selected = false, Key key}) : assert(frame != null), super(key: key);

  @override
  Widget buildWidgetContents(BuildContext context) {
    return InkWell(
      onTap: () {
        final currentFilter = AppData.of(context).vSettings.value.filter;

        AppData.of(context).updateFilter(currentFilter.copyWith(frameSize: this.frame.size));
      },
      child: Container(
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
      ),
    );
  }
}

abstract class FrameSizeWidgetDimens {
  static const ITEM_HEIGHT = 30.0;
}