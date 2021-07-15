import 'package:flutter/material.dart';

import '../../resources/AppColors.dart';

/*
 * Mixin used in order to provide a common API for screen layout operations
 */
mixin ScreenMixin {

  /*
   * Builds the main structure for the screen
   *
   * Can be overriden by children for custom layout
   */
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      appBar: this.buildScreenAppBar(context),
      body: SafeArea(child: this.buildScreenContents(context)),
    );
  }

  /*
   * Returns the app bar displayed on screen.
   *
   * Can be overriden by children if needed
   */
  Widget buildScreenAppBar(BuildContext cntxt) {
    final title = this.getScreenTitle(cntxt);

    if (title.isNotEmpty) {
      return AppBar(
        iconTheme: IconThemeData(
          color: AppColors.white,
        ),
        title: Text(title, style: TextStyle(color: AppColors.white,)),
        foregroundColor: AppColors.white,
        automaticallyImplyLeading: this.leading,
        actions: this.getBarActions(cntxt),
      );
    } else {
      return null;
    }
  }

  /*
   * Returns the title displayed in app bar.
   * Return "" to hide the app bar.
   *
   * Can be overriden by children.
   */
  String getScreenTitle(BuildContext cntxt);

  /*
   * Accessor that returns a flag to show/hide back button on app bar.
   *
   * Can be overriden by children
   */
  bool get leading => true;

  /*
   * Accessor for embedded app bar actions
   */
  List<Widget> getBarActions(BuildContext cntxt) => [];

  /*
   * Builds a widget representing the contents of the screen.
   *
   * Must be overriden by children
   */
  Widget buildScreenContents(BuildContext cntxt);
}
