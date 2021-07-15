import 'package:flutter/material.dart';

import '../../../data/repo/BikeRepositoryImpl.dart';

import '../../../common/models/catalog/BikeModel.dart';
import '../../../common/models/detail/BikeInfoModel.dart';

import '../../../domain/bloc/BikeInfoBloc.dart';
import '../../../domain/event/BikeInfoEvent.dart';

import '../../../network/api/DummyCatalogAPIImpl.dart';

import '../../resources/AppDimens.dart';
import '../../resources/AppStyles.dart';
import '../../resources/AppValues.dart';
import '../../utils/AppLocalizations.dart';
import '../convenient/AppNoDataWidget.dart';
import '../core/BaseBlocWidget.dart';
import 'KeyValueWidget.dart';
import 'FakeActionsWidget.dart';


/*
 * Widget that displays additional data about an item
 */
class BikeAdditionalInfoWidget extends BaseBlocWidget<BikeInfoBloc> {
  final BikeModel bike;

  const BikeAdditionalInfoWidget({@required this.bike, Key key})
      : assert(bike != null),
        super(key: key);

  @override
  _BikeAdditionalInfoWidgetState createState() =>
      _BikeAdditionalInfoWidgetState();
}

/*
 * Companion state class
 */
class _BikeAdditionalInfoWidgetState
    extends BaseBlocWidgetState<
      BikeAdditionalInfoWidget,
      BikeInfoBloc,
      BikeInfoEvent,
      BikeInfoModel> {

  _BikeAdditionalInfoWidgetState() : super();

  @override
  Widget buildInitial(BuildContext cntxt) {
    return this._buildUI(cntxt, BikeInfoModel.empty());
  }

  @override
  Widget buildSuccess(BuildContext cntxt, BikeInfoModel data) {
    return this._buildUI(cntxt, data);
  }

  Widget _buildUI(BuildContext cntxt, BikeInfoModel data) {

    // DATA
    if (data.validate()) {
      return Container(
        height: MediaQuery.of(cntxt).size.height,
        alignment: Alignment.center,
        child: ListView(
          children: [
            this._buildTitle(cntxt),
            this._buildDescrip(cntxt, data.descrip),
            KeyValueWidget(
              strKey: AppLocalizations.of(cntxt).translate("info_weight"),
              strValue: data.getFormattedWeight(AppLocalizations.of(cntxt).translate("lb_kg")),
            ),
            KeyValueWidget(
              strKey: AppLocalizations.of(cntxt).translate("info_wheel_size"),
              strValue: data.getFormattedWheelSize(AppLocalizations.of(cntxt).translate("lb_cm")),
            ),
            KeyValueWidget(
              strKey: AppLocalizations.of(cntxt).translate("info_lights"),
              strValue: data.hasFrontLight()
                  ? AppLocalizations.of(cntxt).translate("info_lights_front")
                  : AppLocalizations.of(cntxt).translate("info_lights_none"),
            ),
            KeyValueWidget(
              strKey: "",
              strValue: data.hasRearLight()
                  ? AppLocalizations.of(cntxt).translate("info_lights_rear")
                  : AppLocalizations.of(cntxt).translate("info_lights_none"),
            ),
            FakeActionsWidget()
          ],
        ),
      );

    // NO DATA
    } else {
      return AppNoDataWidget();
    }
  }

  Widget _buildTitle(BuildContext cntxt) {
    return Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.symmetric(vertical: AppDimens.MID_SPACING),
        child: Text(
          AppLocalizations.of(cntxt).translate("info_overview"),
          style: AppStyles.title,
          maxLines: AppValues.ONE_LINE,
        ));
  }

  Widget _buildDescrip(BuildContext cntxt, String descrip) {
    return Text(descrip, style: AppStyles.subtitle);
  }

  @override
  BikeInfoBloc getBlocInstance() => BikeInfoBloc(BikeRepositoryImpl(DummyCatalogAPIImpl()));

  @override
  BikeInfoEvent getEvent() => BikeInfoEvent(this.widget.bike.id);

  @override
  bool isAutocall() => true;
}
