import 'package:flutter_catalog/common/models/catalog/FrameSizeListModel.dart';
import 'package:flutter_catalog/common/models/catalog/PriceRangeModel.dart';

import '../../common/models/catalog/FilterModel.dart';
import '../../common/models/catalog/OrderCriteriaModel.dart';
import '../../common/models/catalog/BikeListModel.dart';


/*
 * Abstraction for bike repository
 */
abstract class IBikeRepository {

  /*
   * Retrieve a list of bike items for the requested page, applying contraints (filter & order) specified
   */
  Future<BikeListModel> getBikesForPage(int page, FilterModel filter, OrderCriteriaModel order);

  /*
   * Retrieve a list with all possible frame size
   */
  Future<FrameSizeListModel> getAvailableFrameSizes();

  /*
   * Retrieve min and max price in the catalog
   */
  Future<PriceRangeModel> getPricesRange();
}