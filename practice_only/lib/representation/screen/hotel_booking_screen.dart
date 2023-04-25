import 'package:flutter/material.dart';
import 'package:practice1/core/constants/dismension.dart';
import 'package:practice1/core/helpers/asset_helper.dart';
import 'package:practice1/representation/screen/guest_and_room_booking.dart';
import 'package:practice1/representation/screen/hotels_screen.dart';
import 'package:practice1/representation/screen/select_date_screen.dart';
import 'package:practice1/representation/widgets/app_bar_container.dart';
import 'package:practice1/representation/widgets/button_widget.dart';
import 'package:practice1/representation/widgets/item_booking_widget.dart';
import 'package:practice1/core/extensions/date_ext.dart';

class HotelBookingScreen extends StatefulWidget {
  HotelBookingScreen({Key? key, String? destination}) : super(key: key);
  static const String routeName = '/hotel_booking_screen';
  @override
  State<HotelBookingScreen> createState() => _HotelBookingScreenState();
}

class _HotelBookingScreenState extends State<HotelBookingScreen> {
  String? DateSelected;
  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      titleString: 'Hotel Booking',
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: kMediumPadding * 2,
            ),
            ItemBookingWidget(
              icon: AssetHelper.location,
              title: 'Destination',
              description: 'South Korea',
              onTap: () {},
            ),
            SizedBox(
              height: kMediumPadding * 1.5,
            ),
            StatefulBuilder(builder: (context, setState) {
              return ItemBookingWidget(
                icon: AssetHelper.calendar,
                title: 'Select Date',
                description: DateSelected ?? '13 Feb - 18 Feb 2021',
                onTap: () async {
                  final result = await Navigator.of(context)
                      .pushNamed(SelectDateScreen.routeName);
                  if (!(result as List<DateTime?>)
                      .any((element) => element == null)) {
                    DateSelected =
                        '${result[0]?.getStartDate} - ${result[1]?.getEndDate}';
                    setState(() {});
                  }
                },
              );
            }),
            SizedBox(
              height: kMediumPadding * 1.5,
            ),
            ItemBookingWidget(
              icon: AssetHelper.room,
              title: 'Guest and Room',
              description: '2 Guest, 1 Room',
              onTap: () {
                Navigator.of(context).pushNamed(GuestAndRoomBooking.routeName);
              },
            ),
            SizedBox(
              height: kMediumPadding,
            ),
            ButtonWidget(
              title: 'Search',
              ontap: () {
                Navigator.of(context).pushNamed(HotelsScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
