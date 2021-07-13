import 'package:flutter/material.dart';

import 'PriceModel.dart';
import 'ImageModel.dart';
import '../core/BaseModel.dart';


class FrameSizeModel extends BaseModel {
  static const DEFAULT_UNIT = "cm";
  static const MIN_FRAME_SIZE = 15;
  static const MAX_FRAME_SIZE = 21;
  static const FRAME_STEP = MAX_FRAME_SIZE - MIN_FRAME_SIZE;

  final int size;
  final String unit;

  const FrameSizeModel({this.size = MIN_FRAME_SIZE, this.unit = DEFAULT_UNIT}) : assert(size >= MIN_FRAME_SIZE || size <= MAX_FRAME_SIZE), super();

  factory FrameSizeModel.min() => FrameSizeModel(size: MIN_FRAME_SIZE);

  factory FrameSizeModel.max() => FrameSizeModel(size: MAX_FRAME_SIZE);

  @override
  bool validate() {
    return this.size >= MIN_FRAME_SIZE && this.size <= MAX_FRAME_SIZE;
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
