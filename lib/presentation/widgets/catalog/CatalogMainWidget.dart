import 'package:flutter/material.dart';


import '../../../common/models/OrderCriteriaModel.dart';
import '../../../common/models/FilterModel.dart';

import '../settings/OrderingWidget.dart';
import '../../widgets/catalog/CatalogListWidget.dart';
import '../../utils/AppLocalizations.dart';

import '../core/BaseStatelessWidget.dart';


/*
 * Widget containing a selector and a list
 */
class CatalogMainWidget extends BaseStatelessWidget {
  final OrderCriteriaModel order = OrderCriteriaModelFactory.priceAscending("");
  final FilterModel filter = FilterModel();

  CatalogMainWidget({Key key}) : super(key: key);

  @override
  Widget buildWidgetContents(BuildContext context) {
    final criterias = OrderCriteriaModelFactory.getAllCriterias(
        lbPriceAsc: AppLocalizations.of(context).translate("order_price_asc"),
        lbPriceDesc: AppLocalizations.of(context).translate("order_price_desc")
    );

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        OrderingWidget(
          criterias: criterias,
          selectedId: this.order.id),
        Expanded(
          child: CatalogListWidget(
            order: this.order,
            filter: this.filter
          )
        )
      ],
    );
  }
}