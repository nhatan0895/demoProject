import 'package:flutter/cupertino.dart';
import 'package:practice1/core/data/models/hotel_model.dart';
import 'package:practice1/core/helpers/asset_helper.dart';
import 'package:practice1/representation/widgets/app_bar_container.dart';
import 'package:flutter/material.dart';
import 'package:practice1/representation/widgets/item_hotels_widget.dart';

class HotelsScreen extends StatefulWidget {
  HotelsScreen({Key? key}) : super(key: key);

  static const String routeName = '/hotels_screen';
  @override
  State<HotelsScreen> createState() => _HotelsScreenState();
}

class _HotelsScreenState extends State<HotelsScreen> {
   final List<HotelModel> listHotel = [
    HotelModel(
      hotelImage: AssetHelper.hotel1,
      hotelName: 'Royal Palm Heritage',
      location: 'Purwokerto, Jateng',
      awayKilometer: '364 m',
      star: 4.5,
      numberOfReview: 3241,
      price: 143,
    ),
    HotelModel(
      hotelImage: AssetHelper.hotel2,
      hotelName: 'Grand Luxury\'s',
      location: 'Banyumas, Jateng',
      awayKilometer: '2.3 km',
      star: 4.2,
      numberOfReview: 3241,
      price: 234,
    ),
    HotelModel(
      hotelImage: AssetHelper.hotel3,
      hotelName: 'The Orlando House',
      location: 'Ajibarang, Jateng',
      awayKilometer: '1.1 km',
      star: 3.8,
      numberOfReview: 1234,
      price: 132,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      titleString: 'Hotels',
      child: SingleChildScrollView(
        child: Column(
          children: 
          listHotel.map((e) => ItemHotelsWidget(hotelModel: e)).toList(),
        ),
      ),
    );
  }
}
