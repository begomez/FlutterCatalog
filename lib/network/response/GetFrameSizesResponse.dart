import 'package:flutter_catalog/common/models/MessageModel.dart';
import 'package:flutter_catalog/common/models/catalog/FrameSizeModel.dart';

import '../../common/models/catalog/OrderCriteriaModel.dart';

import 'core/BaseResponse.dart';


/*
 * Response object used when retrieving frame sizes items from remote server
 */
class GetFrameSizesResponse extends BaseResponse {
  final List<FrameSizeModel> data;
  final MessageModel msg;

  const GetFrameSizesResponse(this.data, this.msg) : super();

  @override
  bool hasData() => this.data.isNotEmpty;
}