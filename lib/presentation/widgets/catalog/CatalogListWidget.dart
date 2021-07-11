import 'package:flutter/material.dart';
import 'package:flutter_catalog/presentation/navigation/AppNavigator.dart';
import 'package:flutter_catalog/presentation/widgets/catalog/CatalogItemWidget.dart';
import 'package:flutter_catalog/presentation/widgets/convenient/AppNoDataWidget.dart';

import '../../../common/models/FilterModel.dart';
import '../../../common/models/OrderCriteriaModel.dart';
import '../../../common/models/BikeModel.dart';
import '../../../common/models/BikeListModel.dart';
import '../../../domain/bloc/CatalogBloc.dart';
import '../../../domain/event/CatalogEvent.dart';

import '../../../network/api/CatalogAPIImpl.dart';

import '../core/BaseBlocWidget.dart';


/*
 * Widget displaying a list of bike items
 */
class CatalogListWidget extends BaseBlocWidget<CatalogBloc> {

  CatalogListWidget({Key key}) : super(key: key);

  @override
  _CatalogListWidgetState createState() => _CatalogListWidgetState();
}

/*
 * Companion state class
 */
class _CatalogListWidgetState
    extends BaseBlocWidgetState<CatalogListWidget, CatalogBloc, CatalogEvent, BikeListModel> {

  @override
  Widget buildInitial(BuildContext cntxt) {
    return this._buildList(cntxt, []);
  }

  @override
  Widget buildSuccess(BuildContext cntxt, BikeListModel data) {
    return this._buildList(cntxt, data.collection);
  }

  Widget _buildList(BuildContext cntxt, List<BikeModel> list) {

    if (list.isEmpty) {
      return AppNoDataWidget();
    } else {
      return ListView.builder(itemBuilder: (cntxt, index) => CatalogItemWidget(this._onItemClicked, list[index]), itemCount: list.length,);
    }
  }

  @override
  CatalogBloc getBlocInstance() => CatalogBloc(CatalogAPIImpl());

  @override
  CatalogEvent getEvent() =>
    CatalogEvent(1, OrderCriteriaModelFactory.priceAscending(), FilterModel());

  @override
  bool isAutocall() => true;

  void _onItemClicked(BikeModel bike) async {
    await AppNavigator.toDetail(this.context, bike);
  }
}