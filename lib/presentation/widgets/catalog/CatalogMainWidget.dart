import 'package:flutter/material.dart';

import '../../../common/models/catalog/OrderCriteriaModel.dart';
import '../../../common/models/catalog/FilterModel.dart';

import '../../resources/AppDimens.dart';
import '../core/BaseStatelessWidget.dart';
import '../../utils/AppLocalizations.dart';
import '../AppBarWidget.dart';
import 'OrderingWidget.dart';
import 'CatalogListWidget.dart';



/*
 * Widget containing:
 * - app bar
 * - order selector
 * - list of bikes
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
    
    return Scaffold(
      body: CustomScrollView(
      slivers: [

        // bar
        AppBarWidget(title: AppLocalizations.of(context).translate("app_name")),

        // ordering
        SliverPadding(
          padding: EdgeInsets.all(AppDimens.SMALL_SPACING),
          sliver: SliverToBoxAdapter(
            child: OrderingWidget(
                criterias: criterias,
                current: this.order),
          ),
        ),

        // list
        SliverToBoxAdapter(child: CatalogListWidget(order: this.order, filter: this.filter))
      ]),
    );
  }
}