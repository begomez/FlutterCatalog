import 'BikeModel.dart';

import '../core/BaseModel.dart';


/*
 * Model to encapsulate filtering data
 */
class FilterModel extends BaseModel {
  final List<BikeCategories> categs;
  final double price;
  final int frameSize;


  const FilterModel({this.categs, this.price = 0.0, this.frameSize = 0}) : super();

  factory FilterModel.empty() => FilterModel();

  FilterModel copyWith({double price, int size, BikeCategories categ}) =>
      FilterModel(
        frameSize: size?? this.frameSize,
        categs: categ?? this.categs,
        price: price?? this.price
      );

  @override
  bool validate() => this.hasValidCategory() || this.hasValidPrice() || this.hasValidFrameSize();

  bool hasValidCategory() => this.categs != null;

  bool hasValidPrice() => this.price > 0.0;

  bool hasValidFrameSize() => this.frameSize > 0;
}