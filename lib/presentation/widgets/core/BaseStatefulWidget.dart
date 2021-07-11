import 'package:flutter/material.dart';


/*
 * Base class for widgets with dynamic state that uses NO BloC.
 * When needing BLoC usage, see BaseBlocWidget
 */
abstract class BaseStatefulWidget extends StatefulWidget {
  const BaseStatefulWidget({Key key}) : super(key: key);

  @override
  BaseState createState();
}

/*
 * Companion state class
 */
abstract class BaseState<T extends BaseStatefulWidget>
    extends State<T> {
  BaseState() : super();

  @override
  Widget build(BuildContext context) {
    return this.buildWidgetContents(context);
  }

  /**
   * Returns widget contents.
   * 
   * Must be overriden by children
   */
  Widget buildWidgetContents(BuildContext context);
}
