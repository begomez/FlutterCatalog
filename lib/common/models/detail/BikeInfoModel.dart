import '../core/BaseModel.dart';

/*
 * Data model with additional info about a bike
 */
class BikeInfoModel extends BaseModel {
  static const NUM_DECIMALS = 2;

  final int id;
  final String descrip;
  final double weight;
  final double wheelSize;
  final bool frontLight;
  final bool rearLight;

  const BikeInfoModel(
      {this.id = -1,
      this.descrip = "",
      this.weight = 0.0,
      this.wheelSize = 0.0,
      this.frontLight = false,
      this.rearLight = false})
      : super();

  factory BikeInfoModel.empty() => BikeInfoModel();

  @override
  bool validate() => this.id >= 0 && this.descrip.isNotEmpty;

  bool hasFrontLight() => this.frontLight;

  bool hasRearLight() => this.rearLight;

  String getFormattedWeight({String suffix = ""}) =>
      this.weight.toStringAsFixed(NUM_DECIMALS) + suffix;

  String getFormattedWheelSize({String suffix = ""}) =>
      this.wheelSize.toStringAsFixed(NUM_DECIMALS) + suffix;
}
