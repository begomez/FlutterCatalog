import 'dart:io';
import 'package:flutter/foundation.dart'; //-> compute()

import '../../common/models/catalog/BikeModel.dart';
import '../../common/models/detail/BikeInfoModel.dart';
import '../../common/models/catalog/FrameSizeListModel.dart';
import '../../common/models/catalog/PriceRangeModel.dart';
import '../../common/models/catalog/BikeListModel.dart';
import '../../common/models/filters/FilterModel.dart';
import '../../common/models/filters/OrderCriteriaModel.dart';
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
  Future<BikeListModel> getBikesForPage(
      int page, FilterModel filter, OrderCriteriaModel order) async {
    try {
      final result =
          await this._api.getBikes(GetBikesRequest(page, order, filter));

      if (result.hasData()) {
        var rawData = result.data;

        var processedData =
            await this._processDataInBackground(rawData, order, filter);

        return BikeListModel(
            collection: processedData, pagination: result.pagination);
      } else {
        throw Exception();
      }
    } on IOException catch (ioe) {
      AppLogger.e(tag: "getBikesForPage($page)", msg: "", error: ioe);

      throw ioe;
    } on Exception catch (e) {
      AppLogger.e(tag: "getBikesForPage($page)", msg: "", error: e);

      throw DataException();
    }
  }

  @override
  Future<FrameSizeListModel> getAvailableFrameSizes() async {
    try {
      final result = await this._api.getFrameSizes(GetFrameSizesRequest());

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
      final result = await this._api.getPriceRange(GetPriceRangesRequest());

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
      final result = await this._api.getBikeInfo(GetBikeInfoRequest(id));

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
   * Entry point for "compute()" which performs filtering and sorting
   */
  Future<List<BikeModel>> _processDataInBackground(List<BikeModel> data,
      OrderCriteriaModel order, FilterModel filter) async {
    return await compute(
        _filterAndSort, _ComputeDataModel(data, order, filter));
  }
}

// GLOBAL  //////////////////////////////////////////////////////////////////////////////

/*
 * Applies sorting and filtering constraints over a list so the resulting items meet the specifications
 */
List<BikeModel> _filterAndSort(_ComputeDataModel wrapper) {
  FilterModel filter = wrapper.filter;
  OrderCriteriaModel order = wrapper.order;
  List<BikeModel> data = wrapper.list;

  //_dumpSelection(data, filter: filter, order: order, msg: "PRE");

// FILTERS

  // BY CATEG
  if (filter.hasValidCategories()) {
    data =
        data.where((element) => filter.categs.contains(element.categ)).toList();
  }

  // BY FRAME SIZE
  if (filter.hasValidFrameSize()) {
    data = data
        .where((element) => (filter.frameSize >= element.frameSize.size))
        .toList();
  }

  // BY PRICE
  if (filter.hasValidPrice()) {
    data =
        data.where((element) => element.price.amount <= filter.price).toList();
  }

// ORDER

  if (order.validate()) {
    data.sort(order.getComparator());
  }

  //_dumpSelection(data, filter: filter, order: order, msg: "POST");

  return data;
}

/*
 * Outputs a collection
 */
void _dumpSelection(List<BikeModel> list,
    {FilterModel filter, OrderCriteriaModel order, String msg = ""}) {
  AppLogger.i(
      tag: TAG,
      msg: msg + "----------------------------------------------------------");
  AppLogger.i(tag: TAG, msg: filter?.toString());
  AppLogger.i(tag: TAG, msg: order?.toString());

  list?.forEach((element) {
    AppLogger.i(tag: TAG, msg: element.toString());
  });

  AppLogger.i(tag: TAG, msg: "Containing ${list?.length ?? 0} items");
}

/*
 * Struct used to encapsulate params in a single obj. so it can be accepted as
 * param by compute()
 */
class _ComputeDataModel {
  List<BikeModel> list;
  OrderCriteriaModel order;
  FilterModel filter;

  _ComputeDataModel(this.list, this.order, this.filter);
}
