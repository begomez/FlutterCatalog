import 'package:flutter_catalog/common/factory/FakeModelFactory.dart';
import 'package:flutter_catalog/common/models/detail/BikeInfoModel.dart';
import 'package:flutter_catalog/data/repo/BikeRepositoryImpl.dart';
import 'package:flutter_catalog/domain/bloc/BikeInfoBloc.dart';
import 'package:flutter_catalog/domain/event/BikeInfoEvent.dart';
import 'package:flutter_catalog/domain/repo/IBikeRepository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'BikeInfoBloc_test.mocks.dart';

@GenerateMocks([BikeRepositoryImpl])
void main() {
  BikeInfoBloc bloc;
  IBikeRepository repo;

  setUp(() {
    repo = MockBikeRepositoryImpl();
    bloc = BikeInfoBloc(repo);
  });

  test("When returning invalid object then error", () async {
    int id = -1;

    when(repo.getBikeInfo(id)).thenAnswer((_) => Future.value(BikeInfoModel.empty()));

    final resp = await bloc.processEvent(BikeInfoEvent(id));

    expect(resp != null, true);
    expect(resp.validate(), false);
  });

  test("When processing event then data is returned", () async {
    int id = 1;

    when(repo.getBikeInfo(id)).thenAnswer((_) => Future.value(FakeModelFactory.randomInfo(id: id)));

    final resp = await bloc.processEvent(BikeInfoEvent(id));

    expect(resp != null, true);
    expect(resp.validate(), true);
  });
}