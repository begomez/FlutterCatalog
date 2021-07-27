import 'package:flutter/material.dart';

import '../../../common/models/filters/OrderCriteriaModel.dart';
import '../../../common/models/filters/FilterModel.dart';

import '../../app/AppData.dart';
import '../../resources/AppDimens.dart';
import '../../utils/AppLocalizations.dart';

import '../core/BaseStatelessWidget.dart';
import '../AppBarWidget.dart';
import 'OrderingWidget.dart';
import 'CatalogListWidget.dart';

/*
 * Wrapper widget for the products catalog containing:
 * - dynamic app bar
 * - order selector
 * - list of bikes
 * 
 * All these items are slivers
 */
class CatalogMainWidget extends BaseStatelessWidget {
  final OrderCriteriaModel order;
  final FilterModel filter;

  const CatalogMainWidget(
      {@required this.order, @required this.filter, Key key})
      : assert(order != null),
        assert(filter != null),
        super(key: key);

  @override
  Widget buildWidgetContents(BuildContext context) {
    final criterias = OrderCriteriaModelFactory.getAllCriterias(
        lbPriceAsc: AppLocalizations.of(context).translate("order_price_asc"),
        lbPriceDesc: AppLocalizations.of(context).translate("order_price_desc"),
        lbCategAsc: AppLocalizations.of(context).translate("order_categ_asc"),
        lbNameAsc: AppLocalizations.of(context).translate("order_name_asc"));

    return Scaffold(
      body: CustomScrollView(slivers: [
        // bar
        AppBarWidget(title: AppLocalizations.of(context).translate("app_name")),

        // ordering
        SliverPadding(
          padding: EdgeInsets.all(AppDimens.SMALL_SPACING),
          sliver: SliverToBoxAdapter(
            child: OrderingWidget(criterias: criterias, current: this.order),
          ),
        ),

        // list
        SliverToBoxAdapter(
            child: CatalogListWidget(order: this.order, filter: this.filter))
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AppData.of(context)
              .updateFilter(AppData.of(context).vSettings.value.filter);
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
