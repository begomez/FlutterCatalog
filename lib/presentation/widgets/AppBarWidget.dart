import 'package:flutter/material.dart';

import '../navigation/AppNavigator.dart';
import '../resources/AppDimens.dart';
import '../resources/AppStyles.dart';
import '../widgets/convenient/AppLoadingWidget.dart';
import '../utils/AppConstants.dart';
import '../resources/AppColors.dart';

import 'core/BaseStatelessWidget.dart';

/*
 * Widget that displays a collapsible app bar with title and image
 */
class AppBarWidget extends BaseStatelessWidget {
  final String title;
  final String imageUrl;

  const AppBarWidget(
      {@required this.title, this.imageUrl = AppConstants.BANNER_URL, Key key})
      : assert(title != null),
        super(key: key);

  @override
  Widget buildWidgetContents(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: true,
      snap: true,
      automaticallyImplyLeading: false,
      toolbarHeight: _AppBarDimens.APPBAR_H,
      expandedHeight: _AppBarDimens.EXPANDED_APPBAR_H,
      actions: [
        this._buildFilterAction(context),
      ],
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: this._buildTitle(context),
        stretchModes: <StretchMode>[
          StretchMode.fadeTitle,
          StretchMode.blurBackground,
        ],
        background: this._buildDecoration(context),
      ),
    );
  }

  Widget _buildFilterAction(BuildContext cntxt) {
    return GestureDetector(
        onTap: () async {
          await AppNavigator.toFilter(cntxt);
        },
        child: Padding(
            padding: EdgeInsets.all(AppDimens.SMALL_SPACING),
            child: Icon(
              Icons.analytics_sharp,
              color: AppColors.white,
              size: _AppBarDimens.ICON_PADDING,
            )));
  }

  Widget _buildTitle(BuildContext cntxt) {
    return Text(
      this.title,
      textAlign: TextAlign.center,
      style: AppStyles.titleWhite,
    );
  }

  Widget _buildDecoration(BuildContext cntxt) {
    return DecoratedBox(
      position: DecorationPosition.foreground,
      decoration: BoxDecoration(
        gradient: RadialGradient(
          radius: _AppBarDimens.GRADIENT_RADIUS,
          colors: [AppColors.primaryDark, AppColors.trans],
        ),
      ),
      child: this._buildImage(cntxt),
    );
  }

  Widget _buildImage(BuildContext cntxt) {
    return Image.network(
      this.imageUrl,
      fit: BoxFit.cover,
      loadingBuilder: (cntxt, child, event) {
        return child == null ? AppLoadingWidget() : child;
      },
    );
  }
}

abstract class _AppBarDimens {
  static const APPBAR_H = 64.0;
  static const EXPANDED_APPBAR_H = 128.0;
  static const GRADIENT_RADIUS = 2.0;
  static const ICON_PADDING = 24.0;
}
