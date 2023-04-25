import 'package:flutter/material.dart';
import 'package:practice1/core/constants/dismension.dart';
import 'package:practice1/core/constants/text.dart';
import 'package:practice1/core/data/models/hotel_model.dart';
import 'package:practice1/core/helpers/asset_helper.dart';
import 'package:practice1/core/helpers/images_helper.dart';
import 'package:practice1/representation/screen/hotel_detail_screen.dart';
import 'package:practice1/representation/widgets/button_widget.dart';
import 'package:practice1/representation/widgets/dashline_widget.dart';

class ItemHotelsWidget extends StatelessWidget {
  const ItemHotelsWidget({Key? key, required this.hotelModel})
      : super(key: key);

  final HotelModel hotelModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kDefaultPadding),
        color: Colors.white,
      ),
      margin: EdgeInsets.only(bottom: kMediumPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(right: kDefaultPadding),
            child: ImageHelper.loadFromAsset(
              hotelModel.hotelImage,
              radius: BorderRadius.only(
                topLeft: Radius.circular(
                  kDefaultPadding,
                ),
                bottomRight: Radius.circular(
                  kDefaultPadding,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(
              kDefaultPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hotelModel.hotelName,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: kDefaultPadding,
                ),
                Row(
                  children: [
                    ImageHelper.loadFromAsset(AssetHelper.location_hotel),
                    SizedBox(
                      width: kMinPadding,
                    ),
                    Text(hotelModel.location),
                    Text(
                      '- ${hotelModel.awayKilometer} from destination',
                      style:
                          TextStyles.defaultStyle.subTitleTextColor.fontCaption,
                      maxLines: 2,
                    ),
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
                    Text(
                      hotelModel.star.toString(),
                    ),
                    Text(
                      ' (${hotelModel.numberOfReview} reviews)',
                      style: TextStyles.defaultStyle.subTitleTextColor,
                    ),
                  ],
                ),
                DashLineWidget(),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '\$${hotelModel.price}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: kMinPadding,
                          ),
                          Text(
                            '/night',
                            style: TextStyles.defaultStyle.fontCaption,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ButtonWidget(
                        title: 'Book a room',
                        ontap: () {
                          Navigator.of(context)
                              .pushNamed(HotelDetailScreen.routeName, arguments: hotelModel);
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
