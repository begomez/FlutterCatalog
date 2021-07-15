import '../../common/ErrorCodes.dart';
import '../../common/models/catalog/PriceRangeModel.dart';
import '../../data/api/ICatalogAPI.dart';
import '../../data/repo/BikeRepositoryImpl.dart';
import '../../domain/repo/IBikeRepository.dart';
import '../../domain/event/PriceRangeEvent.dart';

import 'core/BaseBloc.dart';


/*
 * BLoC that retrieves prices range and updates subscribed widget
 */
class PriceRangeBloc extends BaseBloc<PriceRangeEvent, PriceRangeModel> {
  IBikeRepository _repo;

  PriceRangeBloc(ICatalogAPI api) {
    this._repo = BikeRepositoryImpl(api);
  }

  @override
  Future<PriceRangeModel> processEvent(PriceRangeEvent event) async {
    return await this._repo.getPricesRange();
  }

  @override
  int getErrorCode() => ErrorCodes.PRICE_RANGES;
}