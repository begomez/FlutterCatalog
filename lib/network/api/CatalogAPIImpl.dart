import 'dart:math';

import '../../common/factory/FakeModelFactory.dart';

import '../../data/api/ICatalogAPI.dart';
import '../request/GetBikesRequest.dart';
import '../response/GetBikesResponse.dart';


/*
 * Implementation for operations of remote catalog API
 *
 * @see ICatalogAPI
 */
class CatalogAPIImpl implements ICatalogAPI {

  const CatalogAPIImpl();

  @override
  Future<GetBikesResponse> getBikes(GetBikesRequest req) async {
    return await Future.delayed(Duration(seconds: Random().nextInt(3))).then((value) =>
      GetBikesResponse(
          FakeModelFactory.randomBikes(),
          FakeModelFactory.paginationForPage(req.page),
          FakeModelFactory.success())
    );

  }
}