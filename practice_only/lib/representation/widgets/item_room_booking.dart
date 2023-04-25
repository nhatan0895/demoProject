// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:practice1/core/constants/dismension.dart';
import 'package:practice1/core/constants/text.dart';
import 'package:practice1/core/helpers/images_helper.dart';
import 'package:practice1/representation/screen/checkout_screen.dart';
import 'package:practice1/representation/widgets/button_widget.dart';
import 'package:practice1/representation/widgets/dashline_widget.dart';
import 'package:practice1/representation/widgets/item_unity_hotel.dart';

class ItemRoomBooking extends StatelessWidget {
  ItemRoomBooking({
    Key? key,
    required this.roomImage,
    required this.roomName,
    required this.roomPrice,
    required this.roomSize,
    required this.roomUtility,
    this.onTap,
    required this.numberOfRoom,
  }) : super(key: key);

  final String roomImage;
  final String roomName;
  final int roomPrice;
  final int roomSize;
  final String roomUtility;
  final Function()? onTap;
  final int? numberOfRoom;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(kDefaultPadding),
      margin: EdgeInsets.only(bottom: kMediumPadding),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(
            kItemPadding,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      roomName,
                      style: TextStyles.defaultStyle.fontHeader.bold,
                    ),
                    SizedBox(
                      height: kDefaultPadding,
                    ),
                    Text(
                      'Room size: $roomSize m2',
                      maxLines: 2,
                    ),
                    SizedBox(
                      height: kDefaultPadding,
                    ),
                    Text(
                      roomUtility,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: ImageHelper.loadFromAsset(
                  roomImage,
                  radius: BorderRadius.circular(kItemPadding),
                ),
              ),
            ],
          ),
          ItemUnityHotel(),
          DashLineWidget(),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\$${roomPrice.toString()}',
                      style: TextStyles.defaultStyle.fontHeader.bold,
                    ),
                    SizedBox(
                      height: kMinPadding,
                    ),
                    Text(
                      '/night',
                      style: TextStyles.defaultStyle.fontCaption,
                    )
                  ],
                ),
              ),
              Expanded(
                child: numberOfRoom == null
                    ? ButtonWidget(
                        title: 'Choose',
                        ontap: onTap,
                      )
                    : Text(
                        '$numberOfRoom room',
                        textAlign: TextAlign.end,
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
