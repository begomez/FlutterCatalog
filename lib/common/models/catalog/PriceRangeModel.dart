import 'package:flutter/material.dart';

import '../core/BaseModel.dart';
import 'PriceModel.dart';


/*
 * Data model including a min and a max price
 */
class PriceRangeModel extends BaseModel {
  static const DEFAULT_NUM_STEPS = 5;

  final PriceModel min;
  final PriceModel max;

  const PriceRangeModel({@required this.min, @required this.max}) : assert(min != null), assert(max != null), super();

  factory PriceRangeModel.invalid() => PriceRangeModel(min: PriceModel.free(), max: PriceModel.unit());

  @override
  bool validate() => this.min.validate() && this.max.validate() && (this.min < this.max);

  int getStepSize() => (this.max.amount - this.min.amount) ~/ getNumSteps();

  int getNumSteps() => DEFAULT_NUM_STEPS;
}