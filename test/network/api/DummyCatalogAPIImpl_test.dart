import 'package:flutter_catalog/common/models/filters/FilterModel.dart';
import 'package:flutter_catalog/common/models/filters/OrderCriteriaModel.dart';
import 'package:flutter_catalog/data/api/ICatalogAPI.dart';
import 'package:flutter_catalog/network/api/DummyCatalogAPIImpl.dart';
import 'package:flutter_catalog/network/request/GetBikeInfoRequest.dart';
import 'package:flutter_catalog/network/request/GetBikesRequest.dart';
import 'package:flutter_catalog/network/request/GetFrameSizesRequest.dart';
import 'package:flutter_catalog/network/request/GetPriceRangesRequest.dart';
import 'package:flutter_catalog/network/response/GetBikeInfoResponse.dart';
import 'package:flutter_catalog/network/response/GetBikesResponse.dart';
import 'package:flutter_catalog/network/response/GetFrameSizesResponse.dart';
import 'package:flutter_catalog/network/response/GetPriceRangesResponse.dart';
import 'package:test/test.dart';


void main() {
  ICatalogAPI api;

  setUp(() {
    api = DummyCatalogAPIImpl();
  });

  test("When getting bike info then response has data", () async {
    int id = 1;
    GetBikeInfoResponse resp = await api.getBikeInfo(GetBikeInfoRequest(id));

    expect(resp != null, true);
    expect(resp.hasData(), true);
  });

  test("When getting frame sizes then response has data", () async {
    GetFrameSizesResponse resp = await api.getFrameSizes(GetFrameSizesRequest());

    expect(resp != null, true);
    expect(resp.hasData(), true);
  });

  test("When getting prices range then response has data", () async {
    GetPriceRangesResponse resp = await api.getPriceRange(GetPriceRangesRequest());

    expect(resp != null, true);
    expect(resp.hasData(), true);
  });

  test("When getting catalog list then response has data", () async {
    GetBikesResponse resp = await api.getBikes(GetBikesRequest(1, OrderCriteriaModelFactory.defaultCriteria(), FilterModel.defaultFilter()));

    expect(resp != null, true);
    expect(resp.hasData(), true);
  });
}