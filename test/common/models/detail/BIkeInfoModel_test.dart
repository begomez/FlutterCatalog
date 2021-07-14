import 'package:flutter_catalog/common/models/detail/BikeInfoModel.dart';

import 'package:test/test.dart';


void main() {
  test("When having descrip then valid", () {
    BikeInfoModel bikeInfo = BikeInfoModel(id: 1, descrip: "Some descrip here");

    expect(bikeInfo.validate(), true);
  });

  test("When having no id then invalid", () {
    BikeInfoModel bikeInfo = BikeInfoModel(descrip: "some descrip here too");

    expect(bikeInfo.validate(), false);
  });

  test("When having no descrip then invalid", () {
    BikeInfoModel bikeInfo = BikeInfoModel(id: 1);

    expect(bikeInfo.validate(), false);
  });
}