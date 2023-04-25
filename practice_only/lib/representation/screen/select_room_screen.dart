import 'package:flutter/material.dart';
import 'package:practice1/core/constants/dismension.dart';
import 'package:practice1/core/data/models/room_model.dart';
import 'package:practice1/core/helpers/asset_helper.dart';
import 'package:practice1/representation/widgets/app_bar_container.dart';
import 'package:practice1/representation/widgets/item_room_booking.dart';
import 'checkout_screen.dart';

class SelectRoomScreen extends StatelessWidget {
  SelectRoomScreen({Key? key}) : super(key: key);
  static String routeName = '/select_room_screen';
  List<RoomModel> listRoom = [
    RoomModel(
        roomImage: AssetHelper.room1,
        roomName: 'Deluxe Room',
        utility: 'Free Cancellation',
        size: 27,
        price: 245),
    RoomModel(
        roomImage: AssetHelper.room2,
        roomName: 'Executive Suite',
        utility: 'Non-refundable',
        size: 32,
        price: 289),
    RoomModel(
        roomImage: AssetHelper.room3,
        roomName: 'King Bed Only Room',
        utility: 'Non-refundable',
        size: 24,
        price: 214),
  ];
  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      titleString: 'Select room',
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...listRoom
                .map((e) => Padding(
                      padding: const EdgeInsets.only(bottom: kMediumPadding),
                      child: ItemRoomBooking(
                        numberOfRoom: null,
                        roomImage: e.roomImage,
                        roomName: e.roomName,
                        roomPrice: e.price,
                        roomSize: e.size,
                        roomUtility: e.utility,                    
                        onTap: () {
                          Navigator.of(context).pushNamed(
                              CheckoutScreen.routeName,
                              arguments: e);
                        },
                      ),
                    ))
                .toList(),
            SizedBox(
              height: kDefaultPadding,
            ),
          ],
        ),
      ),
    );
  }
}
