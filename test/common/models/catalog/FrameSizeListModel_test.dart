import 'package:flutter_catalog/common/factory/FakeModelFactory.dart';
import 'package:flutter_catalog/common/models/catalog/FrameSizeListModel.dart';
import 'package:test/test.dart';


void main() {
  test("When having data no pagination then invalid", () {
    FrameSizeListModel frames = FrameSizeListModel(collection: []);

    expect(frames.validate(), false);
  });

  test("When having data and pagination then valid", () {
    FrameSizeListModel frames = FrameSizeListModel(collection: FakeModelFactory.allFrameSizes());

    expect(frames.validate(), true);
  });

}