import 'package:flutter_catalog/common/factory/FakeModelFactory.dart';
import 'package:flutter_catalog/common/models/catalog/ImageModel.dart';
import 'package:test/test.dart';


void main() {
  test("When no url then invalid", () {
    ImageModel img = ImageModel(url: "");

    expect(img.validate(), false);
  });

  test("When url then valid", () {
    ImageModel img = FakeModelFactory.randomImg();

    expect(img.validate(), true);
  });
}