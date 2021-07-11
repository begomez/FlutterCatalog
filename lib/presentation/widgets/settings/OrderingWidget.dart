import 'package:flutter/material.dart';

import '../../../common/models/OrderCriteriaModel.dart';

import '../../resources/AppDimens.dart';
import '../../resources/AppColors.dart';
import '../../resources/AppStyles.dart';
import '../../resources/CatalogStyles.dart';
import '../../utils/AppLocalizations.dart';
import '../core/BaseStatefulWidget.dart';


/*
 * Widget displaying a selector with ordering options
 */
class OrderingWidget extends BaseStatefulWidget {
  final List<OrderCriteriaModel> criterias;
  final int selectedId;// ID for current order criteria

  const OrderingWidget({@required this.criterias, @required this.selectedId, Key key}) : assert(criterias != null), assert(selectedId != null), super(key: key);

  @override
  _OrderingWidgetState createState() => _OrderingWidgetState(
      this.criterias.where((element) => element.id == this.selectedId).toList()[0]
  );
}

/*
 * Companion state class
 */
class _OrderingWidgetState extends BaseState<OrderingWidget> {
  OrderCriteriaModel _currentCriteria;

  _OrderingWidgetState(this._currentCriteria) : super();

  @override
  Widget buildWidgetContents(BuildContext context) {
    return Container(
      height: OrderingWidgetDimens.ORDER_WIDGET_HEIGHT,
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
    return Container(height: OrderingWidgetDimens.SEP_H, color: Colors.red,);
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
        value: this._getSelectedValue(this._currentCriteria.id),
        icon: Icon(Icons.arrow_drop_down),
        isExpanded: true,
        items: this.widget.criterias.map((e) => this._buildDropItem(e)).toList(),
        onChanged: (order) {
          //TODO
        },
      ),
    );
  }

  DropdownMenuItem<OrderCriteriaModel> _buildDropItem(OrderCriteriaModel order) {
    return DropdownMenuItem<OrderCriteriaModel>(
        value: order,
        child: Text(
            order.name,
            style: this._currentCriteria == order? CatalogStyles.selectedItem : CatalogStyles.unselectedItem));
  }

  OrderCriteriaModel _getSelectedValue(int target) {
    final candidates = this.widget.criterias.where((element) => element.id == target).toList();

    return candidates.isNotEmpty? candidates[0] : null;
  }
}

/*
 * UI constants
 */
abstract class OrderingWidgetDimens {
  static const SEP_H = 1.0;
  static const ORDER_WIDGET_HEIGHT = 50.0;
}