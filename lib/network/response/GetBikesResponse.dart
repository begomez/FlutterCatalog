import '../../common/models/catalog/BikeModel.dart';
import '../../common/models/MessageModel.dart';
import '../../common/models/catalog/PaginationModel.dart';

import 'core/BaseResponse.dart';


/*
 * Response object used when retrieving a list of bike items from remote server
 */
class GetBikesResponse extends BaseResponse {
  final List<BikeModel> data;
  final PaginationModel pagination;
  final MessageModel msg;

  const GetBikesResponse(this.data, this.pagination, this.msg) : super();

  @override
  bool hasData() => this.data != null &&  this.pagination != null;
}
