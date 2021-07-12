import 'dart:math';

import 'package:flutter_catalog/common/models/catalog/FrameSizeModel.dart';

import '../models/catalog/FilterModel.dart';
import '../models/catalog/BikeModel.dart';
import '../models/catalog/ImageModel.dart';
import '../models/MessageModel.dart';
import '../models/catalog/PaginationModel.dart';
import '../models/catalog/FrameSizeModel.dart';
import '../models/catalog/PriceModel.dart';
import '../models/catalog/PriceRangeModel.dart';


/*
 * Factory class used to create dummy instances of several data types
 */
abstract class FakeModelFactory {

  static String _randomString({int len = 10}) =>
    String.fromCharCodes(
        List.generate(len, (index) => Random().nextInt(33) + 89)
    );

  static bool _randomBool() =>
      Random().nextBool();

  static FrameSizeModel _randomFrame() {
      final size = Random().nextInt(FrameSizeModel.FRAME_STEP) + FrameSizeModel.MIN_FRAME_SIZE;// [15-21]

      return FrameSizeModel(size: size);
  }

  static List<FrameSizeModel> allFrameSizes() {
    return List.generate(7, (index) => FrameSizeModel(size: FrameSizeModel.MIN_FRAME_SIZE + index)).toList();
  }
  
  static ImageModel _getImgForCateg(BikeCategories categ) {
    switch (categ) {
      case BikeCategories.CITY:
        return _cityBike();
      case BikeCategories.ELECTRIC:
        return _eBikeImg();
      case BikeCategories.MOUNTAIN:
        return _mountainBike();
      default:
        return _randomImg();
    }
  }

  static ImageModel _mountainBike() =>
    ImageModel(url: "https://cdn.brujulabike.com/media/13401/conversions/1-1-1600.jpg");

  static ImageModel _cityBike() =>
    ImageModel(url: "https://www.wigglestatic.com/product-media/104680990/Vitus-Dee-VR-City-Bike-Nexus-2021-Hybrid-Bikes-Black-Quartz-2021-VDVR29NEX21SMBLKQTZ.jpg?w=960&h=550&a=7");

  static ImageModel _eBikeImg() =>
    ImageModel(url: "https://www.ruff-cycles.com/pub/media/img-cms/ruff-cycles-pauljrdesigns-ruffian-3.png");

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

  static PriceRangeModel randomRange() {
    return PriceRangeModel(
        min: _randomPrice(range: PriceRanges.AFFORDABLE),
        max: _randomPrice(range: PriceRanges.EXPENSIVE)
    );
  }

  static BikeCategories _randomCateg() =>
    BikeCategories.values[Random().nextInt(3) + 1];

  static BikeModel randomBike({int id = 1}) {
    BikeCategories categ = _randomCateg();
    
    return BikeModel(
        id: id,
        name: "Bike num. $id",
        frameSize: _randomFrame(),
        categ: categ,
        mainImg: _getImgForCateg(categ),
        price: _randomPrice()
    );
    
  }

  static List<BikeModel> randomBikes({int num = 20}) =>
    List<BikeModel>.generate(num, (index) => randomBike(id: index));

  static FilterModel randomFilter() =>
    FilterModel(
      price: _randomPrice().amount,
      categ: _randomCateg(),
      frameSize: _randomFrame().size,
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
