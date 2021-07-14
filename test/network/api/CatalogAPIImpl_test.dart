import 'package:flutter_catalog/data/api/ICatalogAPI.dart';
import 'package:flutter_catalog/network/api/CatalogAPIImpl.dart';
import 'package:flutter_catalog/network/request/GetBikeInfoRequest.dart';
import 'package:flutter_catalog/network/response/GetBikeInfoResponse.dart';
import 'package:test/test.dart';


void main() {
  ICatalogAPI api;

  setUp(() {
    api = CatalogAPIImpl();
  });

  test("When getting bike info response", () async {
    int id = 1;
    GetBikeInfoResponse resp = await api.getBikeInfo(GetBikeInfoRequest(id));

    expect(resp.hasData(), true);
  });
}