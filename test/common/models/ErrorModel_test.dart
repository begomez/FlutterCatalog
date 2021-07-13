import 'package:test/test.dart';
import 'package:flutter_catalog/common/models/ErrorModel.dart';

void main() {
  test("When no code nor descrip then invalid", () {
    ErrorModel err = ErrorModel.empty();

    expect(err.validate(), false);
  });

  test("When code and descrip then valid", () {
    ErrorModel err = ErrorModel(code: 1, descrip: "Some descrip");

    expect(err.validate(), true);

  });
}