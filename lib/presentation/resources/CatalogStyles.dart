import 'package:flutter/material.dart';

import 'AppStyles.dart';


abstract class CatalogStyles {

  static TextStyle get selectedItem => AppStyles.subtitle.copyWith(fontWeight: FontWeight.bold);

  static TextStyle get unselectedItem => AppStyles.subtitle;
}