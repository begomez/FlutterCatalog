import '../../common/ErrorCodes.dart';
import '../../common/models/catalog/PriceRangeModel.dart';
import '../../domain/event/PriceRangeEvent.dart';
import '../../domain/repo/IBikeRepository.dart';
import 'core/BaseBloc.dart';


/*
 * BLoC that retrieves prices range and updates subscribed widget
 */
class PriceRangeBloc extends BaseBloc<PriceRangeEvent, PriceRangeModel> {
  IBikeRepository _repo;

  PriceRangeBloc(this._repo) : super();

  @override
  Future<PriceRangeModel> processEvent(PriceRangeEvent event) async {
    return await this._repo.getPricesRange();
  }

  @override
  int getErrorCode() => ErrorCodes.PRICE_RANGES;
}