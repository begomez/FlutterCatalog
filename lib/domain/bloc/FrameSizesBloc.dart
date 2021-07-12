import '../../common/ErrorCodes.dart';
import '../../common/models/catalog/FrameSizeListModel.dart';
import '../../data/api/ICatalogAPI.dart';
import '../../data/repo/BikeRepositoryImpl.dart';
import '../../domain/repo/IBikeRepository.dart';
import '../../domain/event/FrameSizesEvent.dart';

import 'core/BaseBloc.dart';

/*
 * BLoC class that retrieves available frame sizes
 */
class FrameSizeBloc extends BaseBloc<FrameSizesEvent, FrameSizeListModel> {
  IBikeRepository _repo;

  FrameSizeBloc(ICatalogAPI api) {
    this._repo = BikeRepositoryImpl(api);
  }

  @override
  Future<FrameSizeListModel> processEvent(FrameSizesEvent event) async {
    return await this._repo.getAvailableFrameSizes();
  }

  @override
  int getErrorCode() => ErrorCodes.FRAME_SIZES;
}