import '../core/BaseModel.dart';

/*
 * Data model that encapsulates a photo URL
 */
class ImageModel extends BaseModel {
  final String url;

  const ImageModel({this.url = ""}) : super();

  @override
  bool validate() {
    return this.url.isNotEmpty;
  }
}