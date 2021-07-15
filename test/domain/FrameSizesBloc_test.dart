import 'package:flutter_catalog/common/factory/FakeModelFactory.dart';
import 'package:flutter_catalog/common/models/catalog/FrameSizeListModel.dart';
import 'package:flutter_catalog/data/repo/BikeRepositoryImpl.dart';
import 'package:flutter_catalog/domain/bloc/FrameSizesBloc.dart';
import 'package:flutter_catalog/domain/event/FrameSizesEvent.dart';
import 'package:flutter_catalog/domain/repo/IBikeRepository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'FrameSizesBloc_test.mocks.dart';

@GenerateMocks([BikeRepositoryImpl])
void main() {
  FrameSizesBloc bloc;
  IBikeRepository repo;

  setUp(() {
    repo = MockBikeRepositoryImpl();
    bloc = FrameSizesBloc(repo);
  });

  test("When returning invalid object then error", () async {
    when(repo.getAvailableFrameSizes()).thenAnswer((_) => Future.value(FrameSizeListModel(collection: [])));

    final resp = await bloc.processEvent(FrameSizesEvent());

    expect(resp != null, true);
    expect(resp.collection.length == 0, true);
    expect(resp.validate(), false);
  });

  test("When processing event then data is returned", () async {
    when(repo.getAvailableFrameSizes()).thenAnswer((_) => Future.value(FrameSizeListModel(collection: FakeModelFactory.allFrameSizes())));

    final resp = await bloc.processEvent(FrameSizesEvent());

    expect(resp != null, true);
    expect(resp.collection.length == 7, true);
    expect(resp.validate(), true);
  });
}