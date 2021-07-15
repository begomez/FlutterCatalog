import '../core/BaseModel.dart';
import '../catalog/PriceModel.dart';
import '../catalog/FrameSizeModel.dart';
import '../catalog/BikeModel.dart';


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
  bool validate() => this.hasValidCategories() || this.hasValidPrice() || this.hasValidFrameSize();

  bool hasValidCategories() => this.categs != null && this.categs.isNotEmpty;

  bool hasValidPrice() => this.price > PriceModel.NO_AMOUNT;

  bool hasValidFrameSize() => this.frameSize > FrameSizeModel.NO_FRAME_SIZE;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FilterModel &&
          runtimeType == other.runtimeType &&
          categs == other.categs &&
          price == other.price &&
          frameSize == other.frameSize;

  @override
  int get hashCode => categs.hashCode ^ price.hashCode ^ frameSize.hashCode;

  @override
  String toString() {
    return "categs: ${categs.toString()} frame: $frameSize price: $price";
  }
}