import 'package:flutter_catalog/common/factory/FakeModelFactory.dart';
import 'package:flutter_catalog/common/models/catalog/PriceRangeModel.dart';
import 'package:flutter_catalog/data/repo/BikeRepositoryImpl.dart';
import 'package:flutter_catalog/domain/bloc/PriceRangeBloc.dart';
import 'package:flutter_catalog/domain/event/PriceRangeEvent.dart';
import 'package:flutter_catalog/domain/repo/IBikeRepository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'PriceRangeBloc_test.mocks.dart';

@GenerateMocks([BikeRepositoryImpl])
void main() {
  PriceRangeBloc bloc;
  IBikeRepository repo;

  setUp(() {
    repo = MockBikeRepositoryImpl();
    bloc = PriceRangeBloc(repo);
  });

  test("When returning invalid object then error", () async {
    when(repo.getPricesRange()).thenAnswer((_) => Future.value(PriceRangeModel.invalid()));

    final resp = await bloc.processEvent(PriceRangeEvent());

    expect(resp != null, true);
    expect(resp.validate(), false);
  });

  test("When processing event then data is returned", () async {
    when(repo.getPricesRange()).thenAnswer((_) => Future.value(FakeModelFactory.randomRange()));

    final resp = await bloc.processEvent(PriceRangeEvent());

    expect(resp != null, true);
    expect(resp.validate(), true);
  });
}