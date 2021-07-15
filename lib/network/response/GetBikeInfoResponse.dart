import '../../common/models/MessageModel.dart';
import '../../common/models/detail/BikeInfoModel.dart';

import 'core/BaseResponse.dart';


/*
 * Response used when getting additional info about an item
 */
class GetBikeInfoResponse extends BaseResponse {
  final BikeInfoModel data;
  final MessageModel message;

  const GetBikeInfoResponse(this.data, this.message) : super();

  @override
  bool hasData() => this.data != null;
}