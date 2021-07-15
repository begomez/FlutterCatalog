import 'package:flutter/material.dart';

import '../../../common/models/ErrorModel.dart';

import '../../utils/AppLocalizations.dart';
import '../core/BaseStatelessWidget.dart';


/*
 * Widget displayed when error
 */
class AppErrorWidget extends BaseStatelessWidget {
  final ErrorModel err;

  const AppErrorWidget({this.err, Key key}) : super(key: key);

  @override
  Widget buildWidgetContents(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/images/error.png"),
          Text(AppLocalizations.of(context).translate("screen_error")),
        ]
      ),
    );
  }
}
