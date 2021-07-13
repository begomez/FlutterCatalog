import 'package:flutter/material.dart';

import '../../resources/AppColors.dart';
import '../../resources/AppDimens.dart';
import '../../utils/AppLocalizations.dart';
import '../factory/AppWidgetFactory.dart';
import '../core/BaseStatefulWidget.dart';
import 'BikeAdditionalInfoWidget.dart';

import '../../../common/models/catalog/BikeModel.dart';


/*
 * Bike main widget displaying item info
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
class _BikeMainWidgetState extends BaseState<BikeMainWidget> with SingleTickerProviderStateMixin {
  AnimationController _ctrl;
  Tween<Offset> _tween;

  _BikeMainWidgetState() : super();

  @override
  void initState() {
    final DURATION_IN_SECS = 1;

    this._tween = Tween<Offset>(begin: const Offset(0.0, 1.0), end: const Offset(0.0, 0.0));

    this._ctrl = AnimationController(vsync: this, duration: Duration(seconds: DURATION_IN_SECS));

    this._launchAnim();

    super.initState();
  }

  @override
  void dispose() {
    this._ctrl?.dispose();

    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  void _launchAnim() {
    this._ctrl.forward();
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
          this._buildImg(context),
          this._buildBtn(context)
        ],
      ),
    );
  }
  
  Widget _buildImg(BuildContext cntxt) {
    return Hero(
      tag: this.widget.bike.toTag(),
      child: Image.network(this.widget.bike.mainImg.url),
    );
  }

  Widget _buildBtn(BuildContext cntxt) {
    return SlideTransition(
        position: this._tween.animate(this._ctrl),
        child: ClipRRect(child: Container(
            width: double.maxFinite,
            child:
            ElevatedButton(
                onPressed: () {
                  AppWidgetFactory.showBottomInfo(
                    context: cntxt,
                    child: BikeAdditionalInfoWidget(bike: this.widget.bike),
                    color: AppColors.white,
                    height: MediaQuery.of(cntxt).size.height * 3/4,
                    onClose: () {
                      Navigator.of(cntxt).pop();
                    },
                    radius: _BikeMainWidgetDimens.RADIUS
                  );
                },
                child: Text(AppLocalizations.of(cntxt).translate("action_more"))
            )
        )
      )
    );
  }
}

abstract class _BikeMainWidgetDimens {
  static const RADIUS = 15.0;
}
