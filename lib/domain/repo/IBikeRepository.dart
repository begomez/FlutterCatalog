import '../../common/models/catalog/FrameSizeListModel.dart';
import '../../common/models/catalog/PriceRangeModel.dart';
import '../../common/models/detail/BikeInfoModel.dart';
import '../../common/models/filters/FilterModel.dart';
import '../../common/models/filters/OrderCriteriaModel.dart';
import '../../common/models/catalog/BikeListModel.dart';


/*
 * Abstraction for bike repository
 */
abstract class IBikeRepository {

  /*
   * Retrieve a list of bike items for the requested page, applying the constraints (filter & order) specified
   */
  Future<BikeListModel> getBikesForPage(int page, FilterModel filter, OrderCriteriaModel order);

  /*
   * Retrieve a list with all possible frame sizes
   */
  Future<FrameSizeListModel> getAvailableFrameSizes();

  /*
   * Retrieve min and max price in the catalog to create a range
   */
  Future<PriceRangeModel> getPricesRange();

  /*
   * Retrieve additional info about an item given its ID
   */
  Future<BikeInfoModel> getBikeInfo(int id);
}