import 'dart:io';

import '../../common/models/catalog/FrameSizeListModel.dart';
import '../../common/models/catalog/PriceRangeModel.dart';
import '../../common/models/catalog/BikeListModel.dart';
import '../../common/models/catalog/FilterModel.dart';
import '../../common/models/catalog/OrderCriteriaModel.dart';
import '../../common/utils/AppLogger.dart';

import '../../domain/repo/IBikeRepository.dart';

import '../../data/api/ICatalogAPI.dart';
import '../../data/exception/DataException.dart';

import '../../network/request/GetBikesRequest.dart';
import '../../network/request/GetFrameSizesRequest.dart';
import '../../network/request/GetPriceRangesRequest.dart';

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
        return BikeListModel(collection: result.data, pagination: result.pagination);

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

}