import 'package:flutter/widgets.dart';
import 'package:practice1/core/constants/dismension.dart';
import 'package:practice1/core/helpers/asset_helper.dart';
import 'package:practice1/representation/widgets/app_bar_container.dart';
import 'package:practice1/representation/widgets/button_widget.dart';
import 'package:practice1/representation/widgets/item_add_guest_and_room.dart';

class GuestAndRoomBooking extends StatefulWidget {
  GuestAndRoomBooking({Key? key}) : super(key: key);
  static const String routeName = '/guest_and_room_booking';
  @override
  State<GuestAndRoomBooking> createState() => _GuestAndRoomBookingState();
}

class _GuestAndRoomBookingState extends State<GuestAndRoomBooking> {
  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      titleString: 'Add Guest And Room',
      child: Column(
        children: [
          SizedBox(
            height: kMediumPadding * 2,
          ),
          ItemAddGuestAndRoom(
            icon: AssetHelper.guest,
            innitData: 2,
            title: 'Guest',
          ),
          ItemAddGuestAndRoom(
            icon: AssetHelper.room,
            innitData: 1,
            title: 'Room',
          ),
          SizedBox(
            height: kMediumPadding * 1,
          ),
          ButtonWidget(
            title: 'Select',
            ontap: () {
              Navigator.of(context).pop();
            },
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          ButtonWidget(
            title: 'Cancel',
            ontap: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
