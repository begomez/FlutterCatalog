import 'BikeModel.dart';

import '../core/BaseModel.dart';
import 'PriceModel.dart';
import 'FrameSizeModel.dart';


/*
 * Model to encapsulate data filters
 */
class FilterModel extends BaseModel {
  final List<BikeCategories> categs;
  final double price;
  final int frameSize;


  const FilterModel({this.categs = const [], this.price = PriceModel.NO_AMOUNT, this.frameSize = FrameSizeModel.NO_FRAME_SIZE}) : super();

  factory FilterModel.empty() => FilterModel();

  factory FilterModel.defaultFilter() => FilterModel();

  FilterModel copyWith({double price, int frameSize, List<BikeCategories> categs}) =>
      FilterModel(
        frameSize: frameSize?? this.frameSize,
        categs: categs?? this.categs,
        price: price?? this.price
      );

  @override
  bool validate() => this.hasValidCategory() || this.hasValidPrice() || this.hasValidFrameSize();

  bool hasValidCategory() => this.categs != null;

  bool hasValidPrice() => this.price > PriceModel.NO_AMOUNT;

  bool hasValidFrameSize() => this.frameSize > FrameSizeModel.NO_FRAME_SIZE;
}