import 'package:flutter/material.dart';
import 'package:flutter_catalog/presentation/resources/AppStyles.dart';

import '../utils/AppConstants.dart';
import '../resources/AppColors.dart';
import 'core/BaseStatelessWidget.dart';


/*
 * Widget that displays a collapsible app bar with title and image
 */
class AppBarWidget extends BaseStatelessWidget {
  final String title;
  final String imageUrl;

  const AppBarWidget({@required this.title, this.imageUrl = AppConstants.BANNER_URL, Key key}) : assert(title != null), super(key: key);

  @override
  Widget buildWidgetContents(BuildContext context) {
    return SliverAppBar(
      pinned: false,
      automaticallyImplyLeading: false,
      toolbarHeight: _AppBarDimens.APPBAR_H,
      expandedHeight: _AppBarDimens.EXPANDED_APPBAR_H,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(this.title, textAlign: TextAlign.center, style: AppStyles.titleWhite,),
        stretchModes: <StretchMode>[
          StretchMode.fadeTitle,
          StretchMode.blurBackground,
        ],
        background: DecoratedBox(
          position: DecorationPosition.foreground,
          decoration: BoxDecoration(
            gradient: RadialGradient(
              radius: _AppBarDimens.GRADIENT_RADIUS,
              colors: [
                AppColors.primaryDark,
                AppColors.trans
              ],
            ),
          ),
          child: Image.network(
            this.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}


abstract class _AppBarDimens {
  static const APPBAR_H = 64.0;
  static const EXPANDED_APPBAR_H = 128.0;
  static const GRADIENT_RADIUS = 2.0;
}
