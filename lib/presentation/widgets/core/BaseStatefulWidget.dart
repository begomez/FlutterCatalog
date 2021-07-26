import 'package:flutter/material.dart';

/*
 * Base class for widgets with dynamic state that use NO BloC.
 * When needing BLoC usage, @see BaseBlocWidget
 */
abstract class BaseStatefulWidget extends StatefulWidget {
  const BaseStatefulWidget({Key key}) : super(key: key);

  @override
  BaseState createState();
}

/*
 * Companion state class
 *
 * It is a generic class receiving:
 *
 * - TargetWidget: data type for widget binded to this state obj
 */
abstract class BaseState<TargetWidget extends BaseStatefulWidget>
    extends State<TargetWidget> {
  BaseState() : super();

  @override
  Widget build(BuildContext context) {
    return this.buildWidgetContents(context);
  }

  /*
   * Returns widget contents.
   * 
   * Must be overriden by children
   */
  Widget buildWidgetContents(BuildContext context);
}
