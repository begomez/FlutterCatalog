import 'dart:math';

import '../../common/factory/FakeModelFactory.dart';

import '../../data/api/ICatalogAPI.dart';

import '../request/GetFrameSizesRequest.dart';
import '../request/GetPriceRangesRequest.dart';
import '../response/GetFrameSizesResponse.dart';
import '../response/GetPriceRangesResponse.dart';
import '../request/GetBikesRequest.dart';
import '../response/GetBikesResponse.dart';
import '../request/GetBikeInfoRequest.dart';
import '../response/GetBikeInfoResponse.dart';


/*
 * Implementation for operations of remote catalog API.
 * It does not fetch data from a real remote server, instead it uses a factory to create dummy data.
 *
 * @see ICatalogAPI
 */
class DummyCatalogAPIImpl implements ICatalogAPI {
  final MAX_RESPONSE_TIME_IN_SECS = 3;

  const DummyCatalogAPIImpl();


  @override
  Future<GetBikesResponse> getBikes(GetBikesRequest req) async {
    return await Future.delayed(Duration(seconds: Random().nextInt(MAX_RESPONSE_TIME_IN_SECS))).then((value) =>
      GetBikesResponse(
          FakeModelFactory.randomBikes(),
          FakeModelFactory.paginationForPage(req.page),
          FakeModelFactory.success())
    );
  }

  @override
  Future<GetFrameSizesResponse> getFrameSizes(GetFrameSizesRequest req) async {
    return await Future.delayed(Duration(seconds: 1)).then((value) =>
        GetFrameSizesResponse(
          FakeModelFactory.allFrameSizes(),
          FakeModelFactory.success()
        )
    );
  }

  @override
  Future<GetPriceRangesResponse> getPriceRange(GetPriceRangesRequest req) async {
    return await Future.delayed(Duration(seconds: 1)).then((value) =>
        GetPriceRangesResponse(
          FakeModelFactory.randomRange(),
          FakeModelFactory.success()
        )
    );
  }

  @override
  Future<GetBikeInfoResponse> getBikeInfo(GetBikeInfoRequest req) async {
    return await Future.delayed(Duration(seconds: Random().nextInt(3))).then((value) =>
        GetBikeInfoResponse(
          FakeModelFactory.randomInfo(id: req.id),
          FakeModelFactory.success()
        )
    );
  }
}
