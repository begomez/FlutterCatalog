import 'package:flutter_catalog/common/models/core/BaseModel.dart';


/*
 * Data model that encapsulates info about remote pictures
 */
class ImageModel extends BaseModel {
  final String url;

  const ImageModel({this.url = ""}) : super();

  @override
  bool validate() {
    return this.url.isNotEmpty;
  }
}