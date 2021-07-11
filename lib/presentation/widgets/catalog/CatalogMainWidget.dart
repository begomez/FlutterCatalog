import 'package:flutter/material.dart';


import '../../../common/models/catalog/OrderCriteriaModel.dart';
import '../../../common/models/catalog/FilterModel.dart';

import 'OrderingWidget.dart';
import '../../widgets/catalog/CatalogListWidget.dart';
import '../../utils/AppLocalizations.dart';

import '../core/BaseStatelessWidget.dart';


/*
 * Widget containing:
 * - an order selector
 * - a list of bikes
 */
class CatalogMainWidget extends BaseStatelessWidget {
  final OrderCriteriaModel order;
  final FilterModel filter;

  CatalogMainWidget({@required this.order, @required this.filter, Key key}) : assert(order != null), assert(filter != null), super(key: key);

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
          current: this.order),
        Expanded(
          child: CatalogListWidget(
            order:this.order,
            filter: this.filter
          )
        )
      ],
    );
  }
}