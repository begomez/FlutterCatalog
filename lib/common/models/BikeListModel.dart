import 'package:flutter_catalog/common/models/PaginationModel.dart';

import 'BikeModel.dart';
import 'core/BaseModel.dart';


/*
 * Data model with a collection of bike entities
 */
class BikeListModel extends BaseModel {

  final List<BikeModel> collection;

  final PaginationModel pagination;

  BikeListModel({this.collection = const [], this.pagination}) : super();

  @override
  bool validate() => this.collection.isNotEmpty && this.pagination != null;
}