import 'package:flutter_catalog/common/models/catalog/FrameSizeModel.dart';

import 'PriceModel.dart';
import 'ImageModel.dart';
import '../core/BaseModel.dart';


enum BikeCategories {UNKNOWN, MOUNTAIN, CITY, ELECTRIC}



/*
 * Data model that represents a bike entity
 */
class BikeModel extends BaseModel {

  final int id;
  final PriceModel price;
  final String name;
  final ImageModel mainImg;
  final BikeCategories categ;
  final FrameSizeModel frameSize;

  const BikeModel({this.id = BaseModel.NO_ID, this.price = const PriceModel(), this.name = "", this.mainImg = const ImageModel(), this.categ = BikeCategories.UNKNOWN, this.frameSize = const FrameSizeModel(size: FrameSizeModel.MIN_FRAME_SIZE)}) : super();

  @override
  bool validate() {
    return this.id >= 0 && this.price.validate() && this.name.isNotEmpty;
  }

  String toTag() => "bike${this.id}";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BikeModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          price == other.price &&
          name == other.name &&
          mainImg == other.mainImg &&
          categ == other.categ &&
          frameSize == other.frameSize;

  @override
  int get hashCode =>
      id.hashCode ^
      price.hashCode ^
      name.hashCode ^
      mainImg.hashCode ^
      categ.hashCode ^
      frameSize.hashCode;

  @override
  String toString() {
    return "ID: $id price: $price frame: $frameSize categ: $categ";
  }
}