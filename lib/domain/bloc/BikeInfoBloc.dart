import '../../common/ErrorCodes.dart';

import '../../data/api/ICatalogAPI.dart';
import '../../data/repo/BikeRepositoryImpl.dart';

import '../../domain/repo/IBikeRepository.dart';
import '../../domain/event/BikeInfoEvent.dart';

import '../../common/models/detail/BikeInfoModel.dart';

import 'core/BaseBloc.dart';


/*
 * BLoC class that retrieves additional data about a bike
 */
class BikeInfoBloc extends BaseBloc<BikeInfoEvent, BikeInfoModel> {
  IBikeRepository _repo;

  BikeInfoBloc(ICatalogAPI api) : super() {
    this._repo = BikeRepositoryImpl(api);
  }

  @override
  Future<BikeInfoModel> processEvent(BikeInfoEvent event) async {
    return await this._repo.getBikeInfo(event.id);
  }

  @override
  int getErrorCode() => ErrorCodes.BIKE_INFO;
}