import 'package:flutter/material.dart';

import '../../../common/models/ErrorModel.dart';
import '../../../common/models/core/BaseModel.dart';

import '../../../domain/bloc/core/BaseBloc.dart';
import '../../../domain/event/core/BaseEvent.dart';

import '../../widgets/core/BaseStatefulWidget.dart';
import '../../widgets/core/BlocMixin.dart';
import '../../widgets/convenient/AppErrorWidget.dart';
import '../../widgets/convenient/AppLoadingWidget.dart';

/*
 * Base class for widgets that use BLoC to perform some operation: 
 * data retrieval, data storage, etc.
 * 
 * It is a generic class receiving:
 * - TargetBloc: data type for the BLoC used by this widget
 */
abstract class BaseBlocWidget<TargetBloc extends BaseBloc>
    extends BaseStatefulWidget {
  const BaseBlocWidget({Key key}) : super(key: key);

  @override
  BaseBlocWidgetState createState();
}

/*
 * Companion state class  
 * 
 * It is a generic class receiving:
 *
 * - TargetWidget: data type for widget binded to this state obj
 * - TargetBloc: data type for the BLoC declared in the underlying mixin
 * - TargetEvent: data type for the event used as bloc input
 * - TargetModel: data type for the model returned by bloc
 */
abstract class BaseBlocWidgetState<
        TargetWidget extends BaseBlocWidget,
        TargetBloc extends BaseBloc,
        TargetEvent extends BaseEvent,
        TargetModel extends BaseModel> extends BaseState<TargetWidget>
    with BlocMixin<TargetBloc, TargetEvent, TargetModel> {
  BaseBlocWidgetState() : super() {
    this.initMixin(autocall: this.isAutocall(), bloc: this.getBlocInstance());
  }

  @override
  void didChangeDependencies() {
    if (this.isAutocall()) {
      this.call();
    }

    super.didChangeDependencies();
  }

  @override
  Widget buildWidgetContents(BuildContext context) {
    if (this.hasBloc()) {
      return this.buildWidgetAccordingToState(context);
    } else {
      return Container(
          alignment: Alignment.center,
          width: double.maxFinite,
          color: Colors.red,
          child: Text("Call initMixin(params) from constructor()!!!"));
    }
  }

  @override
  Widget buildLoading(BuildContext cntxt) => Stack(
        children: [this.buildInitial(cntxt), AppLoadingWidget()],
      );

  @override
  Widget buildError(BuildContext cntxt, ErrorModel err) {
    return AppErrorWidget(
      err: err,
    );
  }

  /*
   * Returns flag for autocall behavior
   */
  bool isAutocall();

  /*
   * Returns instance of BLoC required by widget
   */
  TargetBloc getBlocInstance();
}
