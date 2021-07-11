import 'dart:async';

import '../../common/ErrorCodes.dart';
import '../../common/models/BikeListModel.dart';
import '../../data/api/ICatalogAPI.dart';
import '../../data/repo/BikeRepositoryImpl.dart';
import '../../domain/repo/IBikeRepository.dart';
import '../../domain/event/CatalogEvent.dart';

import 'core/BaseBloc.dart';


/*
 * BLoC class that retrieves catalog data
 */
class CatalogBloc extends BaseBloc<CatalogEvent, BikeListModel> {
  IBikeRepository _repo;

  CatalogBloc(ICatalogAPI api) : super() {
    this._repo = BikeRepositoryImpl(api);
  }

  @override
  Future<BikeListModel> processEvent(CatalogEvent event) async {
    return await this._repo.getBikesForPage(event.page, event.filter, event.order);
  }

  @override
  int getErrorCode() => ErrorCodes.CATALOG;
}