import 'package:flutter/material.dart';

import '../../resources/AppDimens.dart';
import '../../navigation/AppNavigator.dart';
import '../catalog/CatalogItemWidget.dart';
import '../convenient/AppNoDataWidget.dart';
import '../core/BaseBlocWidget.dart';

import '../../../common/models/filters/FilterModel.dart';
import '../../../common/models/catalog/OrderCriteriaModel.dart';
import '../../../common/models/catalog/BikeModel.dart';
import '../../../common/models/catalog/BikeListModel.dart';

import '../../../domain/bloc/CatalogBloc.dart';
import '../../../domain/event/CatalogEvent.dart';

import '../../../network/api/CatalogAPIImpl.dart';


/*
 * Widget displaying a list of bike items
 */
class CatalogListWidget extends BaseBlocWidget<CatalogBloc> {
  final OrderCriteriaModel order;
  final FilterModel filter;

  const CatalogListWidget({@required this.order, @required this.filter, Key key}) :  assert(order != null), assert(filter != null), super(key: key);

  @override
  _CatalogListWidgetState createState() => _CatalogListWidgetState();
}

/*
 * Companion state class
 */
class _CatalogListWidgetState
    extends BaseBlocWidgetState<CatalogListWidget, CatalogBloc, CatalogEvent, BikeListModel> {
  int currentPage = 1;

  _CatalogListWidgetState() : super();

  @override
  Widget buildInitial(BuildContext cntxt) {
    return this._buildListWrapper(cntxt, []);
  }

  @override
  Widget buildSuccess(BuildContext cntxt, BikeListModel data) {
    return this._buildListWrapper(cntxt, data.collection);
  }
  
  @override
  Widget buildLoading(BuildContext cntxt) {
    return Container(
        alignment: Alignment.center,
        height: MediaQuery.of(cntxt).size.height / 2,
        child: super.buildLoading(cntxt)
    );
  }

  Widget _buildListWrapper(BuildContext cntxt, List<BikeModel> data) {
    return Container(
      margin: EdgeInsets.only(bottom: AppDimens.BIG_SPACING),
      height: MediaQuery.of(cntxt).size.height * 1.0,
      child: this._buildList(cntxt, data)
    );
  }

  Widget _buildList(BuildContext cntxt, List<BikeModel> list) {

    if (list.isEmpty) {
      return AppNoDataWidget();
    } else {
      return ListView.builder(
          itemBuilder: (cntxt, index) {
            return CatalogItemWidget(this._onItemClicked, list[index]);
          },
          itemCount: list.length,
      );
    }
  }

  @override
  CatalogBloc getBlocInstance() => CatalogBloc(CatalogAPIImpl());

  @override
  CatalogEvent getEvent() =>
    CatalogEvent(this.currentPage, this.widget.order, this.widget.filter);

  @override
  bool isAutocall() => true;

  void _onItemClicked(BikeModel bike) async {
    await AppNavigator.toDetail(this.context, bike);
  }
}