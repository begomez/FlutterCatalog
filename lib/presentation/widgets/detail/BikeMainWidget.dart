import 'package:flutter/material.dart';

import '../../../common/models/catalog/BikeModel.dart';

import '../../resources/AppStyles.dart';
import '../../resources/AppColors.dart';
import '../../resources/AppDimens.dart';
import '../../utils/AppLocalizations.dart';
import '../factory/AppWidgetFactory.dart';
import '../core/BaseStatefulWidget.dart';
import '../detail/KeyValueWidget.dart';
import 'BikeAdditionalInfoWidget.dart';

/*
 * Bike main widget displaying info about selected item
 */
class BikeMainWidget extends BaseStatefulWidget {
  final BikeModel bike;

  const BikeMainWidget(this.bike, {Key key}) : super(key: key);

  @override
  _BikeMainWidgetState createState() => _BikeMainWidgetState();
}

/*
 * Companion state class
 */
class _BikeMainWidgetState extends BaseState<BikeMainWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _ctrl;
  Tween<Offset> _tween;

  _BikeMainWidgetState() : super();

  @override
  void initState() {
    final DURATION_IN_SECS = 1;

    this._tween = Tween<Offset>(
        begin: const Offset(0.0, 1.0), end: const Offset(0.0, 0.0));

    this._ctrl = AnimationController(
        vsync: this, duration: Duration(seconds: DURATION_IN_SECS));

    this._ctrl.forward();

    super.initState();
  }

  @override
  void dispose() {
    this._ctrl?.dispose();

    super.dispose();
  }

  @override
  Widget buildWidgetContents(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.all(AppDimens.MID_SPACING),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: this._buildImg(context)),
          KeyValueWidget(
            strKey: AppLocalizations.of(context).translate("lb_category"),
            strValue: this.widget.bike.categ.toShortString(),
          ),
          KeyValueWidget(
            strKey: AppLocalizations.of(context).translate("lb_frame"),
            strValue: this.widget.bike.frameSize.toString(),
          ),
          KeyValueWidget(
            strKey: AppLocalizations.of(context).translate("lb_price"),
            strValue: this.widget.bike.price.toString(),
          ),
          this._buildMainAction(context)
        ],
      ),
    );
  }

  Widget _buildImg(BuildContext cntxt) {
    return Hero(
      tag: this.widget.bike.toTag(),
      child: Container(
          alignment: Alignment.center,
          child: Image.network(this.widget.bike.mainImg.url)),
    );
  }

  Widget _buildMainAction(BuildContext cntxt) {
    return SlideTransition(
        position: this._tween.animate(this._ctrl),
        child: ClipRRect(
            child: Container(
                width: double.maxFinite,
                child: AppWidgetFactory.buildBtn(
                    callback: () {
                      AppWidgetFactory.showBottomInfo(
                          context: cntxt,
                          child:
                              BikeAdditionalInfoWidget(bike: this.widget.bike),
                          color: AppColors.accentLight,
                          height: MediaQuery.of(cntxt).size.height * 4 / 5,
                          onClose: () {
                            Navigator.of(cntxt).pop();
                          },
                          radius: _BikeMainWidgetDimens.RADIUS);
                    },
                    style: AppStyles.action,
                    text:
                        AppLocalizations.of(cntxt).translate("action_more")))));
  }
}

abstract class _BikeMainWidgetDimens {
  static const RADIUS = 15.0;
}
