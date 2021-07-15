import 'package:flutter/material.dart';

import '../../../common/models/filters/OrderCriteriaModel.dart';

import '../../resources/AppDimens.dart';
import '../../resources/AppColors.dart';
import '../../resources/AppStyles.dart';
import '../../resources/CatalogStyles.dart';
import '../../utils/AppLocalizations.dart';
import '../../app/AppData.dart';
import '../core/BaseStatelessWidget.dart';


/*
 * Widget displaying a selector with ordering options
 */
class OrderingWidget extends BaseStatelessWidget {
  final List<OrderCriteriaModel> criterias;
  final OrderCriteriaModel current;

  const OrderingWidget({@required this.criterias, @required this.current, Key key}) : assert(criterias != null), assert(current != null), super(key: key);

  @override
  Widget buildWidgetContents(BuildContext context) {
    return Container(
      height: _OrderingWidgetDimens.ORDER_WIDGET_HEIGHT,
      child: this._buildRowContents(context),
    );
  }

  Widget _buildRowContents(BuildContext cntxt) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: this._buildDivider(cntxt)),
        Expanded(child: this._buildHint(cntxt)),
        Expanded(child: this._buildSelector(cntxt))
      ],
    );
  }

  Widget _buildDivider(BuildContext cntxt) {
    return Container(height: _OrderingWidgetDimens.SEP_H, color: AppColors.primary,);
  }

  Widget _buildHint(BuildContext cntxt) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.MID_SPACING),
      child: Text(AppLocalizations.of(cntxt).translate("lb_order"), style: AppStyles.subtitle,),
    );
  }

  Widget _buildSelector(BuildContext cntxt) {
    return Container(
      child: DropdownButton<OrderCriteriaModel>(
        isDense: false,
        underline: Container(width: 0.0,),
        dropdownColor: AppColors.white,
        value: this._getSelectedValue(this.current.id),
        icon: Icon(Icons.arrow_drop_down),
        isExpanded: true,
        items: this.criterias.map((e) => this._buildDropItem(e)).toList(),
        onChanged: (order) {
          AppData.of(cntxt).updateOrder(order);
        },
      ),
    );
  }

  DropdownMenuItem<OrderCriteriaModel> _buildDropItem(OrderCriteriaModel order) {
    return DropdownMenuItem<OrderCriteriaModel>(
        value: order,
        child: Text(
            order.name,
            style: this.current == order? CatalogStyles.selectedItem : CatalogStyles.unselectedItem));
  }

  OrderCriteriaModel _getSelectedValue(int target) {
    final candidates = this.criterias.where((element) => element.id == target).toList();

    return candidates.isNotEmpty? candidates[0] : null;
  }
}

abstract class _OrderingWidgetDimens {
  static const SEP_H = 1.0;
  static const ORDER_WIDGET_HEIGHT = 50.0;
}