import 'dart:async';

import '../../common/ErrorCodes.dart';
import '../../common/models/catalog/BikeListModel.dart';
import '../../domain/event/CatalogEvent.dart';
import '../../domain/repo/IBikeRepository.dart';
import 'core/BaseBloc.dart';


/*
 * BLoC that retrieves catalog data and updates subscribed widget
 */
class CatalogBloc extends BaseBloc<CatalogEvent, BikeListModel> {
  IBikeRepository _repo;

  CatalogBloc(this._repo) : super();

  @override
  Future<BikeListModel> processEvent(CatalogEvent event) async {
    return await this._repo.getBikesForPage(event.page, event.filter, event.order);
  }

  @override
  int getErrorCode() => ErrorCodes.CATALOG;
}