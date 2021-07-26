import 'package:flutter_catalog/common/models/ErrorModel.dart';
import 'package:flutter_catalog/common/models/result/ResourceResult.dart';
import 'package:test/test.dart';

void main() {
  test("When status is loading then loading", () {
      ResourceResult res = ResourceResult(status: ResourceStatus.LOADING);

      expect(res.isLoading(), true);
      expect(res.isSuccess(), false);
      expect(res.isError(), false);
      expect(res.isInitial(), false);
  });

  test("When status is initial then initial", () {
    ResourceResult res = ResourceResult(status: ResourceStatus.INITIAL);

    expect(res.isInitial(), true);
    expect(res.isSuccess(), false);
    expect(res.isError(), false);
    expect(res.isLoading(), false);
  });

  test("When status is success then success", () {
    ResourceResult res = ResourceResult(status: ResourceStatus.SUCCESS);

    expect(res.isSuccess(), true);
    expect(res.isInitial(), false);
    expect(res.isError(), false);
    expect(res.isLoading(), false);
  });

  test("When status is error then error", () {
    ResourceResult res = ResourceResult(status: ResourceStatus.ERROR);

    expect(res.isError(), true);
    expect(res.isSuccess(), false);
    expect(res.isInitial(), false);
    expect(res.isLoading(), false);
  });

  test("When has data then success", () {
    ResourceResult<String> res = ResourceResult(data: "Some data");

    expect(res.hasData(), true);
    expect(res.hasError(), false);
  });

  test("When has error then error", () {
    ResourceResult<String> res = ResourceResult(error: ErrorModel(code: 1, descrip: "Some error"));

    expect(res.hasError(), true);
    expect(res.hasData(), false);
  });
}