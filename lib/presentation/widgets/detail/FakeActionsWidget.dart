import 'package:flutter/material.dart';

import '../../resources/AppColors.dart';
import '../../resources/AppStyles.dart';
import '../../utils/AppLocalizations.dart';
import '../factory/AppWidgetFactory.dart';
import '../core/BaseStatelessWidget.dart';


/*
 * Widget with "dummy" actions for a given item
 */
class FakeActionsWidget extends BaseStatelessWidget {

  const FakeActionsWidget({Key key}) : super(key: key);

  @override
  Widget buildWidgetContents(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          flex: 3,
          child: this._buildMainAction(context),
        ),
        Flexible(
          flex: 1,
          child: this._buildIcon(context, Icons.share_sharp),
        ),
        Flexible(
          flex: 1,
          child: this._buildIcon(context, Icons.favorite),
        ),
        Flexible(
          flex: 1,
          child: this._buildIcon(context, Icons.comment),
        )
      ],
    );
  }

  Widget _buildMainAction(BuildContext cntxt) {
    return AppWidgetFactory.buildBtn(
      text: AppLocalizations.of(cntxt).translate("action_buy"),
      callback: () {
        AppWidgetFactory.notAvailable(cntxt);
      },
      style: AppStyles.action
    );
  }

  Widget _buildIcon(BuildContext cntxt, IconData data) {
    return IconButton(icon: Icon(data), color: AppColors.primaryDark, onPressed: () {
      AppWidgetFactory.notAvailable(cntxt);
    },);
  }
}