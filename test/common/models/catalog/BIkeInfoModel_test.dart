import 'package:flutter_catalog/common/models/catalog/BikeInfoModel.dart';

import 'package:test/test.dart';


void main() {
  test("When having descrip then valid", () {
    BikeInfoModel bikeInfo = BikeInfoModel(descrip: "Some descrip here");

    expect(bikeInfo.validate(), true);
  });

  test("When having no descrip then invalid", () {
    BikeInfoModel bikeInfo = BikeInfoModel();

    expect(bikeInfo.validate(), false);
  });
}