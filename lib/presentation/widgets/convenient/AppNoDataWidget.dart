import 'package:flutter/material.dart';

import '../../utils/AppLocalizations.dart';
import '../core/BaseStatelessWidget.dart';


/*
 * Widget displayed when no data available
 */
class AppNoDataWidget extends BaseStatelessWidget {
  const AppNoDataWidget({Key key}) : super(key: key);

  @override
  Widget buildWidgetContents(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(AppLocalizations.of(context).translate("error_no_data")),
    );
  }
}
