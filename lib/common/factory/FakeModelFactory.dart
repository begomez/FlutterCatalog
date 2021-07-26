import 'dart:math';

import '../models/catalog/FrameSizeModel.dart';
import '../models/detail/BikeInfoModel.dart';
import '../models/filters/FilterModel.dart';
import '../models/catalog/BikeModel.dart';
import '../models/catalog/ImageModel.dart';
import '../models/MessageModel.dart';
import '../models/catalog/PaginationModel.dart';
import '../models/catalog/PriceModel.dart';
import '../models/catalog/PriceRangeModel.dart';

/*
 * Factory class used to create dummy instances of several data types
 */
abstract class FakeModelFactory {
  static String _randomString({int len = 10}) => String.fromCharCodes(
      List.generate(len, (index) => Random().nextInt(33) + 89));

  static bool _randomBool() => Random().nextBool();

  static ImageModel _getImgForCateg(BikeCategories categ) {
    switch (categ) {
      case BikeCategories.CITY:
        return _cityBike();
      case BikeCategories.ELECTRIC:
        return _eBikeImg();
      case BikeCategories.MOUNTAIN:
        return _mountainBike();
      default:
        return randomImg();
    }
  }

  static ImageModel _mountainBike() => ImageModel(
      url: "https://cdn.brujulabike.com/media/13401/conversions/1-1-1600.jpg");

  static ImageModel _cityBike() => ImageModel(
      url:
          "https://www.wigglestatic.com/product-media/104680990/Vitus-Dee-VR-City-Bike-Nexus-2021-Hybrid-Bikes-Black-Quartz-2021-VDVR29NEX21SMBLKQTZ.jpg?w=960&h=550&a=7");

  static ImageModel _eBikeImg() => ImageModel(
      url:
          "http://cdn.shopify.com/s/files/1/0562/1088/2738/products/DetelEV_EASY_Plus_Red_1_1616564133.jpg?v=1622714450");

  static ImageModel randomImg() => ImageModel(
      url:
          "https://trek.scene7.com/is/image/TrekBicycleProducts/Supercaliber_BikeoftheYear_ES_HomepageMarquee?");

  static PriceModel _randomPrice({PriceRanges range = PriceRanges.MID}) {
    switch (range) {
      case PriceRanges.AFFORDABLE:
        return PriceModel(amount: 1000.0 + Random().nextInt(100).toDouble());
      case PriceRanges.MID:
        return PriceModel(amount: 3000.0 + Random().nextInt(500).toDouble());
      case PriceRanges.EXPENSIVE:
        return PriceModel(amount: 5000.0 + Random().nextInt(1000).toDouble());
    }
  }

  static PriceRangeModel randomRange() {
    return PriceRangeModel(
        min: PriceModel(amount: 1000.0), max: PriceModel(amount: 6000.0));
  }

  static PriceRanges _randomPriceRange() =>
      PriceRanges.values[Random().nextInt(3)];

  static BikeCategories _randomCateg() =>
      BikeCategories.values[Random().nextInt(3) + 1];

  static List<FrameSizeModel> allFrameSizes() {
    return List.generate(
            7,
            (index) =>
                FrameSizeModel.forSize(FrameSizeModel.MIN_FRAME_SIZE + index))
        .toList();
  }

  static FrameSizeModel randomFrame() {
    final size = Random().nextInt(FrameSizeModel.FRAME_STEP) +
        FrameSizeModel.MIN_FRAME_SIZE; // [15-21]

    return FrameSizeModel(size: size);
  }

  static FilterModel randomFilter() => FilterModel(
        price: _randomPrice().amount,
        categs: [_randomCateg()],
        frameSize: randomFrame().size,
      );

  static List<BikeModel> randomBikes({int num = 25}) =>
      List<BikeModel>.generate(num, (index) => randomBike(id: index));

  static BikeModel randomBike({int id = 1}) {
    BikeCategories categ = _randomCateg();

    return BikeModel(
        id: id,
        name: "Bike num. $id",
        frameSize: randomFrame(),
        categ: categ,
        mainImg: _getImgForCateg(categ),
        price: _randomPrice(range: _randomPriceRange()));
  }

  static BikeInfoModel randomInfo({int id}) => BikeInfoModel(
        id: id,
        descrip: _randomDescrip(),
        weight: _randomWeight(),
        wheelSize: _randomWheelSize(),
        rearLight: _randomBool(),
        frontLight: _randomBool(),
      );

  static String _randomDescrip() =>
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

  static double _randomWeight() => Random().nextInt(40).toDouble() + 10.0;

  static double _randomWheelSize() => Random().nextInt(40).toDouble() + 20.0;

  static PaginationModel paginationForPage(int page) => PaginationModel(
      currentPage: page,
      totalPages: TOTAL_PAGES,
      itemsPerPage: 20,
      hasMoreData: page < TOTAL_PAGES);

  static MessageModel success() => MessageModel.success();

  static MessageModel error() => MessageModel.error();

  static const TOTAL_PAGES = 10;
}
