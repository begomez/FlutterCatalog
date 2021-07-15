import '../../common/ErrorCodes.dart';
import '../../common/models/detail/BikeInfoModel.dart';
import '../../domain/event/BikeInfoEvent.dart';
import '../../domain/repo/IBikeRepository.dart';
import 'core/BaseBloc.dart';


/*
 * BLoC that retrieves additional data about a bike and updates subscribed widget
 */
class BikeInfoBloc extends BaseBloc<BikeInfoEvent, BikeInfoModel> {
  IBikeRepository _repo;

  BikeInfoBloc(this._repo) : super();

  @override
  Future<BikeInfoModel> processEvent(BikeInfoEvent event) async {
    return await this._repo.getBikeInfo(event.id);
  }

  @override
  int getErrorCode() => ErrorCodes.BIKE_INFO;
}