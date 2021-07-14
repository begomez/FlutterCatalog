import 'dart:io';

import '../../common/models/catalog/BikeModel.dart';
import '../../common/models/detail/BikeInfoModel.dart';
import '../../common/models/catalog/FrameSizeListModel.dart';
import '../../common/models/catalog/PriceRangeModel.dart';
import '../../common/models/catalog/BikeListModel.dart';
import '../../common/models/filters/FilterModel.dart';
import '../../common/models/catalog/OrderCriteriaModel.dart';
import '../../common/utils/AppLogger.dart';

import '../../domain/repo/IBikeRepository.dart';

import '../../data/api/ICatalogAPI.dart';
import '../../data/exception/DataException.dart';

import '../../network/request/GetBikesRequest.dart';
import '../../network/request/GetFrameSizesRequest.dart';
import '../../network/request/GetPriceRangesRequest.dart';
import '../../network/request/GetBikeInfoRequest.dart';


const String TAG = "BikeRepositoryImpl";


/*
 * Implementation of bike repository
 *
 * @see IBikeRepository
 */
class BikeRepositoryImpl implements IBikeRepository {
  final ICatalogAPI _api;

  const BikeRepositoryImpl(this._api);

  @override
  Future<BikeListModel> getBikesForPage(int page, FilterModel filter, OrderCriteriaModel order) async {

    try {
      final result = await this._api.getBikes(GetBikesRequest(page, order, filter));

      if (result.hasData()) {
        var rawData = result.data;

        final processedData = this._filterAndSort(rawData, filter, order);

        return BikeListModel(collection: processedData, pagination: result.pagination);

      } else {
        throw Exception();
      }

    } on IOException catch (ioe) {
      AppLogger.e(tag: "getBikeForPage()", msg: "", error: ioe);

      throw ioe;

    } on Exception catch (e) {
      AppLogger.e(tag: "getBikesForPage()", msg: "", error: e);

      throw DataException();
    }
  }

  @override
  Future<FrameSizeListModel> getAvailableFrameSizes() async {

    try {
      final result = await this._api.getFrameSizes(
        GetFrameSizesRequest()
      );

      if (result.hasData()) {
        return FrameSizeListModel(collection: result.data);

      } else {
        throw Exception();
      }

    } on IOException catch (ioe) {
      AppLogger.e(tag: "getAvailableFrameSizes()", msg: "", error: ioe);

      throw ioe;

    } on Exception catch (e) {
      AppLogger.e(tag: "getAvailableFrameSizes()", msg: "", error: e);

      throw DataException();
    }
  }

  @override
  Future<PriceRangeModel> getPricesRange() async {

    try {
      final result = await this._api.getPriceRange(
          GetPriceRangesRequest()
      );

      if (result.hasData()) {
        return result.data;

      } else {
        throw Exception();
      }

    } on IOException catch (ioe) {
      AppLogger.e(tag: "getPricesRange()", msg: "", error: ioe);

      throw ioe;

    } on Exception catch (e) {
      AppLogger.e(tag: "getPricesRange()", msg: "", error: e);

      throw DataException();
    }
  }

  @override
  Future<BikeInfoModel> getBikeInfo(int id) async {
    try {
      final result = await this._api.getBikeInfo(
          GetBikeInfoRequest(id)
      );

      if (result.hasData()) {
        return result.data;

      } else {
        throw Exception();
      }

    } on IOException catch (ioe) {
      AppLogger.e(tag: "getBikeInfo()", msg: "", error: ioe);

      throw ioe;

    } on Exception catch (e) {
      AppLogger.e(tag: "getBikeInfo()", msg: "", error: e);

      throw DataException();
    }
  }

// HELPERS //////////////////////////////////////////////////////////////////////////////

  /*
   * Applies sorting and filtering constraints over a list so the resulting items meet the specifications
   */
  List<BikeModel> _filterAndSort(List<BikeModel> data, FilterModel filter, OrderCriteriaModel order) {

    // BY CATEG
    if (filter.hasValidCategories()) {
      data = data.where((element) => filter.categs.contains(element.categ)).toList();
    }

    // BY FRAME SIZE
    if (filter.hasValidFrameSize()) {
      data = data.where((element) => (filter.frameSize == element.frameSize.size)).toList();
    }

    // BY PRICE
    if (filter.hasValidPrice()) {
      data = data.where((element) => element.price.amount <= filter.price).toList();
    }

    // ORDERING
    Comparator<BikeModel> comp;
    if (order.validate()) {

      if (order.isPriceAsc()) {
        comp = (a, b) => (a.price.amount - b.price.amount).toInt();

      } else if (order.isPriceDesc()) {
        comp = (a, b) => (b.price.amount - a.price.amount).toInt();

      } else if (order.isCategAsc()) {
        comp = (a, b) => (a.categ.toString().compareTo(b.categ.toString()));

      } else {
        comp = (a, b) => (a.name.compareTo(b.name));
      }

      data.sort(comp);
    }

    this._dumpSelection(data, filter: filter, order: order);

    return data;
  }

  /*
   * Outputs a collection
   */
  void _dumpSelection(List<BikeModel> list, {FilterModel filter, OrderCriteriaModel order}) {
    AppLogger.i(tag: TAG, msg: filter?.toString());
    AppLogger.i(tag: TAG, msg: order?.toString());

    list?.forEach((element) {AppLogger.i(tag: TAG, msg: element.toString());});

    AppLogger.i(tag: TAG, msg: "Containing ${list?.length?? 0} items");
  }
}