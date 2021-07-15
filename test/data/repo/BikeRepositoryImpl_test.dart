import 'package:flutter_catalog/common/factory/FakeModelFactory.dart';
import 'package:flutter_catalog/common/models/MessageModel.dart';
import 'package:flutter_catalog/common/models/catalog/BikeListModel.dart';
import 'package:flutter_catalog/common/models/catalog/FrameSizeListModel.dart';
import 'package:flutter_catalog/common/models/catalog/PaginationModel.dart';
import 'package:flutter_catalog/common/models/catalog/PriceRangeModel.dart';
import 'package:flutter_catalog/common/models/detail/BikeInfoModel.dart';
import 'package:flutter_catalog/common/models/filters/FilterModel.dart';
import 'package:flutter_catalog/common/models/filters/OrderCriteriaModel.dart';
import 'package:flutter_catalog/data/api/ICatalogAPI.dart';
import 'package:flutter_catalog/data/repo/BikeRepositoryImpl.dart';
import 'package:flutter_catalog/domain/repo/IBikeRepository.dart';
import 'package:flutter_catalog/network/api/DummyCatalogAPIImpl.dart';
import 'package:flutter_catalog/network/response/GetBikeInfoResponse.dart';
import 'package:flutter_catalog/network/response/GetBikesResponse.dart';
import 'package:flutter_catalog/network/response/GetFrameSizesResponse.dart';
import 'package:flutter_catalog/network/response/GetPriceRangesResponse.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'BikeRepositoryImpl_test.mocks.dart';

//class DummyCatalogAPIImplMocked extends Mock implements DummyCatalogAPIImpl {}

@GenerateMocks([DummyCatalogAPIImpl])
void main() {
  ICatalogAPI api;
  IBikeRepository repo;

  setUp(() {
    api = MockDummyCatalogAPIImpl();
    repo = BikeRepositoryImpl(api);
  });

  test("When retrieving frame sizes then data is returned", () async {
    when(api.getFrameSizes(any)).thenAnswer((_) => Future.value(GetFrameSizesResponse(FakeModelFactory.allFrameSizes(), MessageModel.success())));

    FrameSizeListModel resp = await repo.getAvailableFrameSizes();

    expect(resp != null, true);
    expect(resp.validate(), true);
  });

  test("When retrieving prices range then data is returned", () async {
    when(api.getPriceRange(any)).thenAnswer((_) => Future.value(GetPriceRangesResponse(FakeModelFactory.randomRange(), MessageModel.success())));

    PriceRangeModel resp = await repo.getPricesRange();

    expect(resp != null, true);
    expect(resp.validate(), true);
  });

  test("When retrieving catalog list then data is returned", () async {
    int page = 1;
    when(api.getBikes(any)).thenAnswer((_) => Future.value(GetBikesResponse(FakeModelFactory.randomBikes(), PaginationModel(), MessageModel.success())));

    BikeListModel resp = await repo.getBikesForPage(1, FilterModel.defaultFilter(), OrderCriteriaModelFactory.defaultCriteria());

    expect(resp != null, true);
    expect(resp.pagination.currentPage == page, true);
    expect(resp.validate(), true);
  });

  test("When retrieving bike info then data is returned", () async {
    int id = 1;

    when(api.getBikeInfo(any)).thenAnswer((_) => Future.value(GetBikeInfoResponse(FakeModelFactory.randomInfo(id: id), MessageModel.success())));

    BikeInfoModel resp = await repo.getBikeInfo(id);

    expect(resp != null, true);
    expect(resp.id == 1, true);
    expect(resp.validate(), true);
  });
}