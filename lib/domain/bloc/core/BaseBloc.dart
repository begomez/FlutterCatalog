import 'dart:async';

import '../../../common/models/core/BaseModel.dart';
import '../../../common/models/ErrorModel.dart';
import '../../../common/models/result/ResourceResult.dart';
import '../../../common/ErrorCodes.dart';

import '../../../data/exception/DataException.dart';

import '../../event/core/BaseEvent.dart';

/*
 * Superclass for BLoC derived classes
 * 
 * It is a generic class receiving:
 *
 * - Input: data type used as bloc input/params
 * - Output: data model type used as bloc output/result
 */
abstract class BaseBloc<Input extends BaseEvent, Output extends BaseModel> {
  StreamController<ResourceResult<Output>> _controller =
      StreamController<ResourceResult<Output>>();

  BaseBloc();

  /*
   * Performs bloc's main operation (data retrieval, data storage...) using based
   * on input parameter
   * 
   * @param event Object containing operation parameters
   */
  void performOperation(Input event) async {
    var result;
    try {
      final data = await this.processEvent(event);

      result = this.buildResult(data: data);
    } on DataException catch (de) {
      result = this.buildResult(data: null, errorCode: ErrorCodes.DATA_ERROR);
    } on Exception catch (e) {
      result = this.buildResult(data: null, errorCode: this.getErrorCode());
    } finally {
      this.processResult(result);
    }
  }

  /*
   * Processes event received and returns result for the operation.
   *
   * Must be overriden by children.
   * 
   * @param event
   */
  Future<Output> processEvent(Input event);

  /*
   * Returns a specific error code for this operation.
   *
   * Should be overriden by children.
   */
  int getErrorCode() => ErrorCodes.INVALID;

  /*
   * Adds a result to the stream controller
   * 
   * @param result
   */
  void processResult(ResourceResult result) {
    if (!this._controller.isClosed) {
      this.input.add(result);
    }
  }

  /*
   * Frees BLoC resources
   */
  void dispose() {
    this.input.close();

    if (!this._controller.isClosed) {
      this._controller.close();
    }
  }

  /*
   * Wraps data on a result object, for consistency across the app
   * 
   * @param data Data returned by the operation performed in the BLoC
   * @param errorCode Possible error code launched when performing the operation
   */
  ResourceResult<Output> buildResult(
      {Output data, int errorCode = ErrorCodes.INVALID}) {
    ErrorModel err = (errorCode >= 0) ? ErrorModel(code: errorCode) : null;
    ResourceStatus status =
        (data != null) ? ResourceStatus.SUCCESS : ResourceStatus.ERROR;

    return ResourceResult<Output>(data: data, error: err, status: status);
  }

  /*
   * Stream accessor
   */
  Stream<ResourceResult<Output>> get output => this._controller.stream;

  /*
   * Sink accessor
   */
  StreamSink<ResourceResult<Output>> get input => this._controller.sink;
}
