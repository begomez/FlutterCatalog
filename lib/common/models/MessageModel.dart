import 'core/BaseModel.dart';


/*
 * Data model that encapsulates key-value pairs
 */
class MessageModel extends BaseModel {
  final String title;
  final String descrip;

  const MessageModel({this.title = "", this.descrip = ""}) : super();

  factory MessageModel.success() => MessageModel(title: "OK", descrip: "");

  factory MessageModel.error() => MessageModel(title: "KO", descrip: "");
}