import 'package:flutter/material.dart';

import 'AppStyles.dart';
import 'AppColors.dart';


abstract class CatalogStyles {

  static TextStyle get selectedItem => AppStyles.subtitle.copyWith(fontWeight: FontWeight.bold);

  static TextStyle get unselectedItem => AppStyles.subtitle;

  static TextStyle get badge => AppStyles.title.copyWith(
    fontSize: 12,
    color: AppColors.white,
    fontWeight: FontWeight.bold,
  );
}