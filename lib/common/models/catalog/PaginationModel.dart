import '../core/BaseModel.dart';


/*
 * Model encapsulating info for list pagination
 */
class PaginationModel extends BaseModel {
  static const FIRST_PAGE = 1;
  static const ITEMS_PER_PAGE = 20;

  final int currentPage;
  final int totalPages;
  final int itemsPerPage;
  final bool hasMoreData;

  const PaginationModel({this.currentPage = FIRST_PAGE, this.totalPages = 1, this.itemsPerPage = ITEMS_PER_PAGE, this.hasMoreData = false}) : super();

  factory PaginationModel.invalid() => const PaginationModel(
    currentPage: -1,
    totalPages: 0,
    itemsPerPage: 0,
    hasMoreData: false
  );

  PaginationModel copyWith({int currentPage, int totalPages, int itemsPerPage, bool hasMoreData}) =>
      PaginationModel(
          currentPage: currentPage?? this.currentPage,
          totalPages: totalPages?? this.totalPages,
          itemsPerPage: itemsPerPage?? this.itemsPerPage,
          hasMoreData: hasMoreData?? this.hasMoreData
      );

  @override
  bool validate() => this.currentPage >= FIRST_PAGE;
}