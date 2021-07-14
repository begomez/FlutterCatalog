import 'package:flutter/material.dart';

import '../core/BaseStatefulWidget.dart';


/*
 * Widget displayed when loading
 */
class AppLoadingWidget extends BaseStatefulWidget {
  const AppLoadingWidget({Key key}) : super(key: key);

  @override
  _AppLoadingWidgetState createState() {
    return _AppLoadingWidgetState();
  }
}

/*
 * Companion state class
 */
class _AppLoadingWidgetState extends BaseState<AppLoadingWidget> with SingleTickerProviderStateMixin {
  static const MIN_VAL = 0.0;
  static const MAX_VAL = 100.0;
  static const DURATION_IN_SECS = 1;

  Tween<double> _tween;
  AnimationController _cntrl;

  _AppLoadingWidgetState() : super();

  @override
  void initState() {
    this._tween = Tween<double>(begin: MIN_VAL, end: MAX_VAL);
    this._cntrl = AnimationController(vsync: this, duration: Duration(seconds: DURATION_IN_SECS));

    this._cntrl.repeat(reverse: true);

    super.initState();
  }

  @override
  void dispose() {
    this._cntrl.dispose();

    super.dispose();
  }

  @override
  Widget buildWidgetContents(BuildContext context) {
    return RotationTransition(
      turns: this._tween.animate(this._cntrl),
      child: Container(
      alignment: Alignment.center,
      child: Image.asset("assets/images/loading.png", width: _AppLoadingWidgetDimens.SIZE, height: _AppLoadingWidgetDimens.SIZE),
      ),
    );
  }
}

abstract class _AppLoadingWidgetDimens {
  static const SIZE = 36.0;
}