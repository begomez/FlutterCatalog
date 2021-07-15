import 'core/BaseRequest.dart';

/*
 * Request used to retrieve additional info about an item
 */
class GetBikeInfoRequest extends BaseRequest {
  final int id;

  const GetBikeInfoRequest(this.id) : super();
}