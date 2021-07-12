import 'package:flutter/material.dart';

import 'PriceModel.dart';
import '../core/BaseModel.dart';


/*
 * Data model including a min and a max price
 */
class PriceRangeModel extends BaseModel {
  final PriceModel min;
  final PriceModel max;

  const PriceRangeModel({@required this.min, @required this.max}) : assert(min != null), assert(max != null), super();

  factory PriceRangeModel.empty() => PriceRangeModel(min: PriceModel.free(), max: PriceModel.unit());

  @override
  bool validate() => this.min.validate() && this.max.validate() && (this.min < this.max);

  int getStepSize() => (this.max.amount - this.min.amount) ~/ getNumSteps();

  int getNumSteps() => 7;
}