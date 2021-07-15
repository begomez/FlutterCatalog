import '../../common/models/filters/FilterModel.dart';
import '../../common/models/filters/OrderCriteriaModel.dart';

import 'core/BaseRequest.dart';


/*
 * Request used to retrieve a list of bike items from remote server
 */
class GetBikesRequest extends BaseRequest {
  final int page;
  final OrderCriteriaModel order;
  final FilterModel filter;

  const GetBikesRequest(this.page, this.order, this.filter) : super();
}
