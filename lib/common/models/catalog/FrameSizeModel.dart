import 'package:flutter/material.dart';

import 'PriceModel.dart';
import 'ImageModel.dart';
import '../core/BaseModel.dart';


class FrameSizeModel extends BaseModel {
  static const DEFAULT_UNIT = "cm";
  static const NO_FRAME_SIZE = 0;
  static const MIN_FRAME_SIZE = 15;
  static const MAX_FRAME_SIZE = 21;
  static const FRAME_STEP = MAX_FRAME_SIZE - MIN_FRAME_SIZE;

  final int size;
  final String unit;
  final String descrip;

  const FrameSizeModel({this.size = MIN_FRAME_SIZE, this.unit = DEFAULT_UNIT, this.descrip = ""}) : assert(size >= MIN_FRAME_SIZE || size <= MAX_FRAME_SIZE), super();

  factory FrameSizeModel.forSize(int size) {
    assert(size >= MIN_FRAME_SIZE);
    assert(size <= MAX_FRAME_SIZE);

    return FrameSizeModel(size: size);
  }

  factory FrameSizeModel.min() => FrameSizeModel(size: MIN_FRAME_SIZE);

  factory FrameSizeModel.max() => FrameSizeModel(size: MAX_FRAME_SIZE);

  @override
  bool validate() {
    return this.size >= MIN_FRAME_SIZE && this.size <= MAX_FRAME_SIZE;
  }

  @override
  String toString() {
    final SEP = " ";

    StringBuffer strb = StringBuffer("");

    strb.write(this.size.toString());
    strb.write(SEP);
    strb.write(this.unit);
    if (this.descrip.isNotEmpty) {
      strb.write(SEP);
      strb.write(this.descrip);
    }

    return strb.toString();
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FrameSizeModel &&
          runtimeType == other.runtimeType &&
          size == other.size &&
          unit == other.unit;

  @override
  int get hashCode => size.hashCode ^ unit.hashCode;
}
