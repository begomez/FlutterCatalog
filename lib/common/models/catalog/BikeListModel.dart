import '../catalog/PaginationModel.dart';
import '../core/BaseModel.dart';
import 'BikeModel.dart';


/*
 * Data model with a collection of bike entities and pag. info
 */
class BikeListModel extends BaseModel {

  final List<BikeModel> collection;

  final PaginationModel pagination;

  BikeListModel({this.collection = const [], this.pagination}) : super();

  @override
  bool validate() => this.collection.isNotEmpty && this.pagination != null;
}