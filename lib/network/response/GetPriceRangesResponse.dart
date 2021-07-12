import '../../common/models/MessageModel.dart';
import '../../common/models/catalog/PriceRangeModel.dart';

import 'core/BaseResponse.dart';


/*
 * Response object used when retrieving a price range from remote server
 */
class GetPriceRangesResponse extends BaseResponse {
  final PriceRangeModel data;
  final MessageModel msg;

  GetPriceRangesResponse(this.data, this.msg) : super();

  @override
  bool hasData() => this.data != null;
}