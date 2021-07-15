import '../../common/ErrorCodes.dart';
import '../../common/models/catalog/FrameSizeListModel.dart';
import '../../domain/event/FrameSizesEvent.dart';
import '../../domain/repo/IBikeRepository.dart';
import 'core/BaseBloc.dart';

/*
 * BLoC that retrieves available frame sizes and updates subscribed widget
 */
class FrameSizesBloc extends BaseBloc<FrameSizesEvent, FrameSizeListModel> {
  IBikeRepository _repo;

  FrameSizesBloc(this._repo) : super();

  @override
  Future<FrameSizeListModel> processEvent(FrameSizesEvent event) async {
    return await this._repo.getAvailableFrameSizes();
  }

  @override
  int getErrorCode() => ErrorCodes.FRAME_SIZES;
}