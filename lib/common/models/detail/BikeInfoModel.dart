import '../core/BaseModel.dart';


/*
 * Data model with additional info about a bike
 */
class BikeInfoModel extends BaseModel {
  final String descrip;
  final double weight;
  final double wheelSize;
  final bool frontLight;
  final bool rearLight;

  const BikeInfoModel({this.descrip = "", this.weight = 0.0, this.wheelSize = 0.0, this.frontLight = false, this.rearLight = false}) :super();

  @override
  bool validate() => this.descrip.isNotEmpty;

  bool hasFrontLight() => this.frontLight;

  bool hasRearLight() => this.rearLight;
}