import 'package:flutter/material.dart';

import '../../resources/AppValues.dart';
import '../../resources/AppDimens.dart';
import '../../resources/AppStyles.dart';
import '../../utils/AppLocalizations.dart';
import '../../app/AppData.dart';
import '../core/BaseStatefulWidget.dart';
import 'BikeTypeWidget.dart';

import '../../../common/models/catalog/BikeModel.dart';


/*
 * Widget that allows user selecting different bike categories
 */
class BikeTypeSelectorWidget extends BaseStatefulWidget {
  final List<BikeCategories> currentSelection;

  BikeTypeSelectorWidget({this.currentSelection = const [], Key key}) : super(key: key);

  @override
  BaseState<BaseStatefulWidget> createState() => _BikeTypeSelectorWidgetState(this.currentSelection);
}

/*
 * Companion state class
 */
class _BikeTypeSelectorWidgetState extends BaseState<BikeTypeSelectorWidget> {
  List<BikeCategories> _selectedCategs;

  _BikeTypeSelectorWidgetState(List<BikeCategories> items) : super() {
    this._selectedCategs = List.of(items);
  }

  @override
  Widget buildWidgetContents(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(AppDimens.MID_SPACING),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          this._buildTitle(context),
          this._buildSelector(context, this._selectedCategs)
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext cntxt) => Text(AppLocalizations.of(cntxt).translate("lb_category"), style: AppStyles.title,  textAlign: TextAlign.start, maxLines: AppValues.ONE_LINE,);

  Widget _buildSelector(BuildContext cntxt, List<BikeCategories> categs) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        this._buildItem(categ: BikeCategories.CITY, selected: this._selectedCategs.contains(BikeCategories.CITY)),
        this._buildItem(categ: BikeCategories.MOUNTAIN, selected: this._selectedCategs.contains(BikeCategories.MOUNTAIN)),
        this._buildItem(categ: BikeCategories.ELECTRIC, selected: this._selectedCategs.contains(BikeCategories.ELECTRIC)),
      ],
    );
  }

  Widget _buildItem({BikeCategories categ, bool selected}) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          this._onItemClicked(categ);
        },
        child: BikeTypeWidget(
          categ: categ,
          selected: selected,
        ),
      ),
    );
  }

  void _onItemClicked(BikeCategories categ) {
    final currentFilterCache = AppData.of(this.context).filterCache;

    if (this._selectedCategs.contains(categ)) {
      this._selectedCategs.remove(categ);

    } else {
      this._selectedCategs.add(categ);
    }

    // Rebuild widget to display changes immediately
    this.setState(() {});

    // Save to cache, it will be applied when confirming
    AppData.of(this.context).saveFilterCache(currentFilterCache.copyWith(categs: this._selectedCategs));
  }
}