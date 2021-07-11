import 'BikeModel.dart';

import 'core/BaseModel.dart';


/*
 * Model to encapsulate filtering data
 */
class FilterModel extends BaseModel {
  final BikeCategories categ;
  final double price;
  final int frameSize;


  const FilterModel({this.categ, this.price = 0.0, this.frameSize = 0}) : super();

  factory FilterModel.empty() => FilterModel();

  @override
  bool validate() => this.hasValidCategory() || this.hasValidPrice() || this.hasValidFrameSize();

  bool hasValidCategory() => this.categ != null;

  bool hasValidPrice() => this.price > 0.0;

  bool hasValidFrameSize() => this.frameSize > 0;
}