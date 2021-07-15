import 'package:flutter_catalog/common/factory/FakeModelFactory.dart';
import 'package:flutter_catalog/common/models/catalog/BikeListModel.dart';
import 'package:flutter_catalog/common/models/catalog/PaginationModel.dart';
import 'package:flutter_catalog/common/models/filters/FilterModel.dart';
import 'package:flutter_catalog/common/models/filters/OrderCriteriaModel.dart';
import 'package:flutter_catalog/data/repo/BikeRepositoryImpl.dart';
import 'package:flutter_catalog/domain/bloc/CatalogBloc.dart';
import 'package:flutter_catalog/domain/event/CatalogEvent.dart';
import 'package:flutter_catalog/domain/repo/IBikeRepository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'CatalogBloc_test.mocks.dart';

@GenerateMocks([BikeRepositoryImpl])
void main() {
  CatalogBloc bloc;
  IBikeRepository repo;

  setUp(() {
    repo = MockBikeRepositoryImpl();
    bloc = CatalogBloc(repo);
  });

  test("When returning invalid object then error", () async {

    when(repo.getBikesForPage(any, any, any)).thenAnswer((_) => Future.value(BikeListModel(collection: [], pagination: PaginationModel())));

    final resp = await bloc.processEvent(CatalogEvent(1, OrderCriteriaModelFactory.defaultCriteria(), FilterModel.defaultFilter()));

    expect(resp != null, true);
    expect(resp.collection.length == 0, true);
    expect(resp.validate(), false);
  });

  test("When processing event then data is returned", () async {
    int id = 1;
    FilterModel filter = FilterModel.defaultFilter();
    OrderCriteriaModel order = OrderCriteriaModelFactory.defaultCriteria();

    when(repo.getBikesForPage(id, filter, order)).thenAnswer((_) => Future.value(BikeListModel(collection: FakeModelFactory.randomBikes(), pagination: PaginationModel())));

    final resp = await bloc.processEvent(CatalogEvent(id, order, filter));

    expect(resp != null, true);
    expect(resp.validate(), true);
    expect(resp.collection.length == 25, true);
  });
}