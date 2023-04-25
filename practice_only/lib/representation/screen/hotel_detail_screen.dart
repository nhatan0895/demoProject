import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:practice1/core/constants/color.dart';
import 'package:practice1/core/constants/dismension.dart';
import 'package:practice1/core/data/models/hotel_model.dart';
import 'package:practice1/core/helpers/asset_helper.dart';
import 'package:practice1/core/helpers/images_helper.dart';
import 'package:practice1/representation/screen/select_room_screen.dart';
import 'package:practice1/representation/widgets/button_widget.dart';

class HotelDetailScreen extends StatefulWidget {
  const HotelDetailScreen({Key? key, required this.hotelModel})
      : super(key: key);

  static const String routeName = '/hotel_detail_screen';

  final HotelModel hotelModel;
  @override
  State<HotelDetailScreen> createState() => _HotelDetailScreenState();
}

class _HotelDetailScreenState extends State<HotelDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: ImageHelper.loadFromAsset(
              AssetHelper.hotel_detail,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: kMediumPadding * 3,
            left: kMediumPadding,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                padding: EdgeInsets.all(kItemPadding),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      kDefaultPadding,
                    ),
                  ),
                ),
                child: Icon(
                  FontAwesomeIcons.arrowLeft,
                  size: 18,
                ),
              ),
            ),
          ),
          Positioned(
            top: kMediumPadding * 3,
            right: kMediumPadding,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                padding: EdgeInsets.all(kItemPadding),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      kDefaultPadding,
                    ),
                  ),
                ),
                child: Icon(
                  FontAwesomeIcons.solidHeart,
                  size: 18,
                  color: Colors.redAccent,
                ),
              ),
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.3,
            maxChildSize: 0.8,
            minChildSize: 0.3,
            builder: (context, ScrollController) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: kMediumPadding),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(kDefaultPadding * 2),
                    topLeft: Radius.circular(kDefaultPadding * 2),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: kDefaultPadding),
                      child: Container(
                        height: 5,
                        width: 60,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              kItemPadding,
                            ),
                          ),
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: kDefaultPadding,
                    ),
                    Expanded(
                      child: ListView(
                        controller: ScrollController,
                        children: [
                          Row(
                            children: [
                              Text(
                                widget.hotelModel.hotelName,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Text(
                                '\$${widget.hotelModel.price}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(' /night'),
                            ],
                          ),
                          SizedBox(
                            height: kDefaultPadding,
                          ),
                          Row(
                            children: [
                              ImageHelper.loadFromAsset(
                                  AssetHelper.location_hotel),
                              SizedBox(
                                height: kDefaultPadding,
                              ),
                              SizedBox(
                                width: kMinPadding,
                              ),
                              Text(widget.hotelModel.location),
                            ],
                          ),
                          SizedBox(
                            height: kDefaultPadding,
                          ),
                          Row(
                            children: [
                              ImageHelper.loadFromAsset(AssetHelper.star_hotel),
                              SizedBox(
                                width: kMinPadding,
                              ),
                              Text('${widget.hotelModel.star}/5'),
                              Text(
                                '(${widget.hotelModel.numberOfReview})',
                                style: TextStyle(
                                  color: ColorPalette.subTitleColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: kDefaultPadding,
                          ),
                          Text(
                            'Information',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: kDefaultPadding,
                          ),
                          Text(
                            'You will find every comfort because many of the services that the hotel offers for travellers and of course the hotel is very comfortable.',
                          ),
                          SizedBox(
                            height: kDefaultPadding,
                          ),
                          Text(
                            'Location',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: kDefaultPadding,
                          ),
                          Text(
                            'Located in the famous neighborhood of Seoul, Grand Luxury’s is set in a building built in the 2010s.',
                          ),
                          SizedBox(
                            height: kDefaultPadding,
                          ),
                          ImageHelper.loadFromAsset(AssetHelper.map),
                          SizedBox(
                            height: kDefaultPadding,
                          ),
                          ButtonWidget(
                            title: 'Select Room',
                            ontap: () {
                              Navigator.of(context)
                                  .pushNamed(SelectRoomScreen.routeName);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
