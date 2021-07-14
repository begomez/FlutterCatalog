import 'package:flutter/material.dart';

import '../../inject/BlocProvider.dart';

import '../../../common/models/ErrorModel.dart';
import '../../../common/models/core/BaseModel.dart';
import '../../../common/models/result/ResourceResult.dart';

import '../../../domain/bloc/core/BaseBloc.dart';
import '../../../domain/event/core/BaseEvent.dart';


/*
 * Mixin used to hook BLoC functionality on widgets.
 * 
 * It is a generic class receiving:
 *
 * - TargetBloc: data type for the BLoC declared in the mixin
 * - TargetEvent: data type for the event used as bloc input
 * - TargetModel: data type for the model returned by bloc
 */
mixin BlocMixin<
    TargetBloc extends BaseBloc,
    TargetEvent extends BaseEvent,
    TargetModel extends BaseModel
    > {

  TargetBloc _bloc = null;
  bool _autocall = false;

  //XXX: must be invoked since mixins have no constructors
  void initMixin({@required TargetBloc bloc, @required bool autocall}) {
    assert(bloc != null);
    assert(autocall != null);

    this._bloc = bloc;
    this._autocall = autocall;
  }

  /*
   * Performs a bloc operation
   */
  void call() {
    TargetEvent dto = this.getEvent();

    // BLOC initialized
    if (this.hasBloc()) {

      // show loading
      this._bloc.processResult(
          ResourceResult<TargetModel>(status: ResourceStatus.LOADING));

      // perform operation
      this._bloc.performOperation(dto);

    // NO BLOC available
    } else {
      throw UnimplementedError("No bloc available in mixin");
    }
  }

  /*
   * Returns a widget depending on current state
   */
  Widget buildWidgetAccordingToState(BuildContext context) {
    return BlocProvider(
        child: StreamBuilder<ResourceResult<TargetModel>>(
          stream: this._bloc.output,
          builder: (cntxt, snap) {
            switch (snap?.data?.status) {
              case ResourceStatus.LOADING:
                return this.buildLoading(cntxt);
              case ResourceStatus.ERROR:
                return this.buildError(cntxt, snap.error);
              case ResourceStatus.SUCCESS:
                return this.buildSuccess(cntxt, snap.data.data);
              case ResourceStatus.INITIAL:
              default:
                return this.buildInitial(cntxt);
            }
          },
        ),
        bloc: this._bloc);
  }

  /*
   * Returns widget to show when bloc is working
   */
  Widget buildLoading(BuildContext cntxt);

  /*
   * Returns widget to show when bloc fails
   */
  Widget buildError(BuildContext cntxt, ErrorModel err);

  /*
   * Returns widget to show when idle
   */
  Widget buildInitial(BuildContext cntxt);

  /*
   * Returns widget to show when operations finishes with no error
   */
  Widget buildSuccess(BuildContext cntxt, TargetModel data);

  /*
   * Returns object used as bloc input.
   */
  TargetEvent getEvent();

  /*
   * Checks if bloc initialized
   */
  bool hasBloc() => (this._bloc != null);
}
