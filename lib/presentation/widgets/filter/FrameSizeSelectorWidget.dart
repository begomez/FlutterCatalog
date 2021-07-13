import 'package:flutter/material.dart';
import 'package:flutter_catalog/presentation/resources/AppDimens.dart';

import '../../resources/AppStyles.dart';
import '../../resources/AppValues.dart';
import '../../utils/AppLocalizations.dart';
import 'FrameSizeWidget.dart';
import '../core/BaseBlocWidget.dart';

import '../../../common/models/catalog/FrameSizeListModel.dart';
import '../../../common/models/catalog/FrameSizeModel.dart';

import '../../../domain/bloc/FrameSizesBloc.dart';
import '../../../domain/event/FrameSizesEvent.dart';

import '../../../network/api/CatalogAPIImpl.dart';


/*
 * Widget that displays different frame sizes and allows user interaction
 */
class FrameSizeSelectorWidget extends BaseBlocWidget<FrameSizesBloc> {
  final FrameSizeModel currentSelection;

  const FrameSizeSelectorWidget({@required this.currentSelection, Key key}) : super(key: key);

  @override
  _FrameSizeSelectorWidgetState createState() => _FrameSizeSelectorWidgetState();
}

/*
 * Companion state class
 */
class _FrameSizeSelectorWidgetState extends BaseBlocWidgetState<FrameSizeSelectorWidget, FrameSizesBloc, FrameSizesEvent, FrameSizeListModel> {

  _FrameSizeSelectorWidgetState() : super();

  Widget _buildUI(BuildContext context, FrameSizeListModel frames) {
    return Container(
      margin: EdgeInsets.all(AppDimens.MID_SPACING),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          this._buildText(context),
          this._buildCollapsible(context, frames.collection)
        ],
      ),
    );
  }

  Widget _buildText(BuildContext cntxt) => Text(AppLocalizations.of(cntxt).translate("lb_frame"), style: AppStyles.title, maxLines: AppValues.ONE_LINE, textAlign: TextAlign.start,);

  Widget _buildCollapsible(BuildContext cntxt, List<FrameSizeModel> frames) {
    return Container(
      margin: EdgeInsets.all(AppDimens.SMALL_SPACING),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: frames.map((e) => FrameSizeWidget(frame: e, selected: (this.widget.currentSelection != null)? e == this.widget.currentSelection : false,)).toList(),
      ),
    );
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
  FrameSizesBloc getBlocInstance() => FrameSizesBloc(CatalogAPIImpl());

  @override
  FrameSizesEvent getEvent() => FrameSizesEvent();

  @override
  bool isAutocall() => true;
}