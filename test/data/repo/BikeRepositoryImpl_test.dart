import 'package:flutter_catalog/common/factory/FakeModelFactory.dart';
import 'package:flutter_catalog/common/models/detail/BikeInfoModel.dart';
import 'package:flutter_catalog/data/api/ICatalogAPI.dart';
import 'package:flutter_catalog/data/repo/BikeRepositoryImpl.dart';
import 'package:flutter_catalog/domain/repo/IBikeRepository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'BikeRepositoryImpl_test.mocks.dart';


@GenerateMocks([BikeRepositoryImpl])
void main() {
  IBikeRepository repo;

  setUp(() {
    repo = MockBikeRepositoryImpl();
  });


  test("When retrieving bike info then...", () async {
    int id = 1;
    when(repo.getBikeInfo(id)).thenAnswer((_) => Future.value(FakeModelFactory.randomInfo(id: id)));

    BikeInfoModel resp = await repo.getBikeInfo(id);

    expect(resp == null, false);
    expect(resp != null, true);
    expect(resp.validate(), true);
    expect(resp.id == 1, true);
  });
}