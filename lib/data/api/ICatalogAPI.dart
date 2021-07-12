import '../../network/request/GetBikesRequest.dart';
import '../../network/response/GetBikesResponse.dart';
import '../../network/request/GetFrameSizesRequest.dart';
import '../../network/response/GetFrameSizesResponse.dart';
import '../../network/request/GetPriceRangesRequest.dart';
import '../../network/response/GetPriceRangesResponse.dart';


/*
 * Abstraction for operations in remote catalog API
 */
abstract class ICatalogAPI {
  Future<GetBikesResponse> getBikes(GetBikesRequest req);
  Future<GetFrameSizesResponse> getFrameSizes(GetFrameSizesRequest req);
  Future<GetPriceRangesResponse> getPriceRange(GetPriceRangesRequest req);
}