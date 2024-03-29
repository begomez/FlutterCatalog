import 'package:flutter/material.dart';

import '../../../data/repo/BikeRepositoryImpl.dart';

import '../../../common/models/catalog/FrameSizeListModel.dart';
import '../../../common/models/catalog/FrameSizeModel.dart';

import '../../../domain/bloc/FrameSizesBloc.dart';
import '../../../domain/event/FrameSizesEvent.dart';

import '../../../network/api/DummyCatalogAPIImpl.dart';

import '../../resources/AppDimens.dart';
import '../../resources/AppStyles.dart';
import '../../resources/AppValues.dart';
import '../../utils/AppLocalizations.dart';
import '../../app/AppData.dart';
import '../core/BaseBlocWidget.dart';
import 'FrameSizeWidget.dart';

/*
 * Widget that displays a collection of frame sizes and allows user selection
 *
 * Frame sizes retrieved dynamically through BLoC
 */
class FrameSizeSelectorWidget extends BaseBlocWidget<FrameSizesBloc> {
  final FrameSizeModel currentSelection;

  const FrameSizeSelectorWidget({@required this.currentSelection, Key key})
      : super(key: key);

  @override
  _FrameSizeSelectorWidgetState createState() =>
      _FrameSizeSelectorWidgetState(this.currentSelection);
}

/*
 * Companion state class
 */
class _FrameSizeSelectorWidgetState extends BaseBlocWidgetState<
    FrameSizeSelectorWidget,
    FrameSizesBloc,
    FrameSizesEvent,
    FrameSizeListModel> {
  FrameSizeModel _selectedFrame;

  _FrameSizeSelectorWidgetState(this._selectedFrame) : super();

  Widget _buildUI(BuildContext context, FrameSizeListModel frames) {
    return Container(
      margin: EdgeInsets.all(AppDimens.MID_SPACING),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          this._buildTitle(context),
          this._buildCollapsible(context, frames.collection)
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext cntxt) => Text(
        AppLocalizations.of(cntxt).translate("lb_frame"),
        style: AppStyles.title,
        maxLines: AppValues.ONE_LINE,
        textAlign: TextAlign.start,
      );

  Widget _buildCollapsible(BuildContext cntxt, List<FrameSizeModel> frames) {
    return Container(
      margin: EdgeInsets.all(AppDimens.SMALL_SPACING),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: this._buildCollapsibleItems(frames),
      ),
    );
  }

  List<Widget> _buildCollapsibleItems(List<FrameSizeModel> frames) {
    return frames
        .map((e) => InkWell(
            onTap: () {
              this._onFrameClicked(e);
            },
            child: FrameSizeWidget(
              frame: e,
              selected: (this._selectedFrame != null)
                  ? e == this._selectedFrame
                  : false,
            )))
        .toList();
  }

  @override
  Widget buildInitial(BuildContext cntxt) {
    return this._buildUI(cntxt, FrameSizeListModel.empty());
  }

  @override
  Widget buildSuccess(BuildContext cntxt, FrameSizeListModel data) {
    return this._buildUI(cntxt, data);
  }

  @override
  FrameSizesBloc getBlocInstance() =>
      FrameSizesBloc(BikeRepositoryImpl(DummyCatalogAPIImpl()));

  @override
  FrameSizesEvent getEvent() => FrameSizesEvent();

  @override
  bool isAutocall() => true;

  void _onFrameClicked(FrameSizeModel frame) {
    final currentFilterCache = AppData.of(this.context).filterCache;

    this.setState(() {
      this._selectedFrame = frame;
    });

    AppData.of(context)
        .saveFilterCache(currentFilterCache.copyWith(frameSize: frame.size));
  }
}
