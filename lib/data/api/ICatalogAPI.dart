import '../../network/request/GetBikesRequest.dart';
import '../../network/response/GetBikesResponse.dart';

/*
 * Abstraction for operations in remote catalog API
 */
abstract class ICatalogAPI {
  Future<GetBikesResponse> getBikes(GetBikesRequest req);
}