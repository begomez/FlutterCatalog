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

  @override
  bool validate() => this.min.validate() && this.max.validate() && (this.min < this.max);
}