import 'dart:io';

import '../../common/models/catalog/BikeListModel.dart';
import '../../common/models/catalog/FilterModel.dart';
import '../../common/models/catalog/OrderCriteriaModel.dart';
import '../../common/utils/AppLogger.dart';

import '../../domain/repo/IBikeRepository.dart';

import '../../data/api/ICatalogAPI.dart';
import '../../data/exception/DataException.dart';

import '../../network/request/GetBikesRequest.dart';


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

}