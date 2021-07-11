import 'BikeModel.dart';
import 'core/BaseModel.dart';


/*
 * Data model with a collection of bike entities
 */
class BikeListModel extends BaseModel {

  final List<BikeModel> collection;

  const BikeListModel({this.collection = const []}) : super();

  @override
  bool validate() => this.collection.isNotEmpty;
}