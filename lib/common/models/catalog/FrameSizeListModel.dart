import '../catalog/FrameSizeModel.dart';
import '../core/BaseModel.dart';

/*
 * Data model with a collection of possible frame sizes
 */
class FrameSizeListModel extends BaseModel {
  final List<FrameSizeModel> collection;

  const FrameSizeListModel({this.collection = const []}) : super();

  factory FrameSizeListModel.empty() => FrameSizeListModel();

  @override
  bool validate() => this.collection != null && this.collection.isNotEmpty;
}