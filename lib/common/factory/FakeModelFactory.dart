import 'dart:math';

import '../models/FilterModel.dart';
import '../models/BikeModel.dart';
import '../models/ImageModel.dart';
import '../models/MessageModel.dart';
import '../models/PaginationModel.dart';
import '../models/PriceModel.dart';
import '../models/UserSessionModel.dart';


/*
 * Factory class used to create dummy instances of several data types
 */
abstract class FakeModelFactory {

  static String _randomUserName() => "Dev";

  static String _randomEmail() => "dev@gmail.com";

  static String _randomString({int len = 10}) =>
    String.fromCharCodes(
        List.generate(len, (index) => Random().nextInt(33) + 89)
    );

  static bool _randomBool() =>
      Random().nextBool();

  static int _randomFrame() =>
      Random().nextInt(100) + 40;

  //https://trek.scene7.com/is/image/TrekBicycleProducts/Supercaliber_BikeoftheYear_ES_HomepageMarquee?$responsive-pjpg$&cache=on,on&wid=1920
  static ImageModel _randomImg() =>
      ImageModel(url: "https://trek.scene7.com/is/image/TrekBicycleProducts/Supercaliber_BikeoftheYear_ES_HomepageMarquee?");

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

  static BikeCategories _randomCateg() =>
    BikeCategories.values[Random().nextInt(2) + 1];

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
      categ: _randomCateg(),
      mainImg: _randomImg(),
      price: _randomPrice()
    );

  static List<BikeModel> randomBikes({int num = 20}) =>
    List<BikeModel>.generate(num, (index) => randomBike(id: index));

  static FilterModel randomFilter() =>
    FilterModel(
      price: _randomPrice().amount,
      categ: _randomCateg(),
      frameSize: _randomFrame(),
    );

  static PaginationModel paginationForPage(int page) =>
    PaginationModel(
      currentPage: page,
      totalPages: TOTAL_PAGES,
      itemsPerPage: 20,
      hasMoreData: page < TOTAL_PAGES
    );

  static MessageModel success() => MessageModel.success();

  static MessageModel error() => MessageModel.error();

  static const TOTAL_PAGES = 10;
}
