import 'dart:math';

import 'package:flutter_catalog/common/models/BikeModel.dart';
import 'package:flutter_catalog/common/models/ImageModel.dart';
import 'package:flutter_catalog/common/models/PriceModel.dart';

import '../models/UserSessionModel.dart';


/*
 * Factory class used to create dummy instances of several data types
 */
abstract class FakeModelFactory {

  static String _randomUserName() => "Dev";

  static String _randomEmail() => "dev@gmail.com";

  static String _randomString({int len = 10}) {
    final rand = Random();
    return String.fromCharCodes(
        List.generate(len, (index) => rand.nextInt(33) + 89)
    );
  }

  static bool _randomBool() => Random().nextBool();

  static int _randomFrame() => Random().nextInt(100) + 40;

  //https://trek.scene7.com/is/image/TrekBicycleProducts/Supercaliber_BikeoftheYear_ES_HomepageMarquee?$responsive-pjpg$&cache=on,on&wid=1920
  static ImageModel _randomImg() => ImageModel(url: "https://trek.scene7.com/is/image/TrekBicycleProducts/Supercaliber_BikeoftheYear_ES_HomepageMarquee?");

  static PriceModel _randomPrice({PriceRanges range = PriceRanges.MID}) {
    switch (range) {
      case PriceRanges.AFFORDABLE:
        return PriceModel(amount: 1000.0 + Random().nextInt(100).toDouble());
      case PriceRanges.MID:
        return PriceModel(amount: 3000.0 + Random().nextInt(300).toDouble());
      case PriceRanges.EXPENSIVE:
        return PriceModel(amount: 5000.0 + Random().nextInt(500).toDouble());
    }
  }

  static UserSessionModel randomUser() =>
    UserSessionModel(
      name: _randomUserName(),
      mail: _randomEmail(),
      token: _randomString());


  static BikeModel randomBike({int id = 1}) =>
    BikeModel(
      id: id,
      name: "Supercaliber $id",
      frameSize: _randomFrame(),
      categ: BikeCategories.values[Random().nextInt(2) + 1],
      mainImg: _randomImg(),
      price: _randomPrice()
    );

  static List<BikeModel> randomBikes({int num = 20}) {
    return List<BikeModel>.generate(num, (index) => randomBike(id: index));
  }
}
