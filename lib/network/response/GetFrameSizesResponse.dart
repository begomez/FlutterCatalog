import '../../common/models/MessageModel.dart';
import '../../common/models/catalog/FrameSizeModel.dart';

import 'core/BaseResponse.dart';


/*
 * Response used when retrieving frame sizes items from remote server
 */
class GetFrameSizesResponse extends BaseResponse {
  final List<FrameSizeModel> data;
  final MessageModel msg;

  const GetFrameSizesResponse(this.data, this.msg) : super();

  @override
  bool hasData() => this.data.isNotEmpty;
}