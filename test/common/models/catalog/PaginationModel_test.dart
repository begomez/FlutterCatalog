import 'package:flutter_catalog/common/factory/FakeModelFactory.dart';
import 'package:flutter_catalog/common/models/catalog/PaginationModel.dart';
import 'package:test/test.dart';


void main() {

  test("When invalid constructor then not valid", () {
    PaginationModel pag = PaginationModel.invalid();

    expect(pag.validate(), false);
  });

  test("When having current page then valid", () {
    PaginationModel pag = PaginationModel(currentPage: PaginationModel.FIRST_PAGE);

    expect(pag.validate(), true);
  });

  test("When pagination starts in 0 then invalid", () {
    PaginationModel pag = PaginationModel(currentPage: 0);

    expect(pag.validate(), false);
  });

  test("When pagination starts in 1 then valid", () {
    PaginationModel pag = PaginationModel(currentPage: PaginationModel.FIRST_PAGE);

    expect(pag.validate(), true);
  });

  test("When copying current then values are mantained", () {
    PaginationModel original = PaginationModel(currentPage: PaginationModel.FIRST_PAGE, totalPages: 2, itemsPerPage: 5, hasMoreData: false);
    PaginationModel copy = original.copyWith(currentPage: 2);

    expect(original.totalPages == copy.totalPages, true);
    expect(original.itemsPerPage == copy.itemsPerPage, true);
    expect(original.hasMoreData == copy.hasMoreData, true);
    expect(original.currentPage == copy.currentPage, false);
  });

  test("When copying total then values are mantained", () {
    PaginationModel original = PaginationModel(currentPage: PaginationModel.FIRST_PAGE, totalPages: 2, itemsPerPage: 5, hasMoreData: false);
    PaginationModel copy = original.copyWith(totalPages: 3);

    expect(original.itemsPerPage == copy.itemsPerPage, true);
    expect(original.hasMoreData == copy.hasMoreData, true);
    expect(original.currentPage == copy.currentPage, true);
    expect(original.totalPages == copy.totalPages, false);
  });

  test("When copying hasMore then values are mantained", () {
    PaginationModel original = PaginationModel(currentPage: PaginationModel.FIRST_PAGE, totalPages: 2, itemsPerPage: 5, hasMoreData: false);
    PaginationModel copy = original.copyWith(hasMoreData: true);

    expect(original.totalPages == copy.totalPages, true);
    expect(original.itemsPerPage == copy.itemsPerPage, true);
    expect(original.currentPage == copy.currentPage, true);
    expect(original.hasMoreData == copy.hasMoreData, false);
  });

  test("When copying items then values are mantained", () {
    PaginationModel original = PaginationModel(currentPage: PaginationModel.FIRST_PAGE, totalPages: 2, itemsPerPage: 5, hasMoreData: false);
    PaginationModel copy = original.copyWith(itemsPerPage: 10);

    expect(original.totalPages == copy.totalPages, true);
    expect(original.hasMoreData == copy.hasMoreData, true);
    expect(original.currentPage == copy.currentPage, true);
    expect(original.itemsPerPage == copy.itemsPerPage, false);
  });
}