import 'package:flutter/material.dart';
import 'package:practice1/core/constants/color.dart';
import 'package:practice1/core/constants/dismension.dart';
import 'package:practice1/core/data/models/room_model.dart';
import 'package:practice1/core/helpers/asset_helper.dart';
import 'package:practice1/core/helpers/images_helper.dart';
import 'package:practice1/representation/screen/main_app.dart';
import 'package:practice1/representation/widgets/app_bar_container.dart';
import 'package:practice1/representation/widgets/button_widget.dart';
import 'package:practice1/representation/widgets/item_room_booking.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({Key? key, required this.roomModel}) : super(key: key);

  static const String routeName = '/checkout_screen';
  final RoomModel roomModel;
  final List<String> listStep = [
    'Book and Review',
    'Payment',
    'Confirm',
  ];
  Widget _buildItemOptionCheckout(
    String icon,
    String titile,
    String value,
    BuildContext context,
  ) {
    return Container(
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(kDefaultPadding),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ImageHelper.loadFromAsset(icon),
              SizedBox(
                width: kItemPadding,
              ),
              Text(
                titile,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: kItemPadding,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            decoration: BoxDecoration(
              color: ColorPalette.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(40),
            ),
            padding: EdgeInsets.all(kMinPadding),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Icon(Icons.add),
                ),
                SizedBox(
                  width: kDefaultPadding,
                ),
                Text(
                  value,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ColorPalette.primaryColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemStepCheckout(
      int step, String stepName, bool isEnd, bool isCheck) {
    return Row(
      children: [
        Container(
          width: kMediumPadding,
          height: kMediumPadding,
          decoration: BoxDecoration(
            color: isCheck ? Colors.white : Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(kMediumPadding),
          ),
          alignment: Alignment.center,
          child: Text(
            step.toString(),
            style: TextStyle(
              color: isCheck ? Colors.black : Colors.white,
            ),
          ),
        ),
        SizedBox(
          width: kMinPadding,
        ),
        Text(
          stepName,
          style: TextStyle(
            color: Colors.white,
            fontSize: 13,
          ),
        ),
        SizedBox(
          width: kMinPadding,
        ),
        if (!isEnd)
          SizedBox(
            width: kDefaultPadding,
            child: Divider(
              height: 1,
              thickness: 1,
              color: Colors.white,
            ),
          ),
        if (!isEnd)
          SizedBox(
            width: kMinPadding,
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      titleString: 'Check Out',
      child: SingleChildScrollView(
        padding: EdgeInsets.all(0),
        child: Column(
          children: [
            Row(
              children: listStep
                  .map((e) => _buildItemStepCheckout(
                      listStep.indexOf(e) + 1,
                      e,
                      listStep.indexOf(e) == listStep.length - 1,
                      listStep.indexOf(e) == 0))
                  .toList(),
            ),
            SizedBox(
              height: kDefaultPadding,
            ),
            ItemRoomBooking(
              roomImage: roomModel.roomImage,
              roomName: roomModel.roomName,
              roomPrice: roomModel.price,
              roomSize: roomModel.size,
              roomUtility: roomModel.utility,
              numberOfRoom: 1,
              onTap: () {},
            ),
            _buildItemOptionCheckout(
                AssetHelper.contact, 'Contact detail', 'Add contact', context),
            SizedBox(
              height: kMediumPadding,
            ),
            _buildItemOptionCheckout(
                AssetHelper.discount, 'Promo code', 'Add promo code', context),
            SizedBox(
              height: kMediumPadding,
            ),
            ButtonWidget(
              title: 'Payment',
              ontap: () {
                Navigator.of(context).popUntil(
                    (route) => route.settings.name == MainApp.routeName);
              },
            ),
            SizedBox(
              height: kDefaultPadding,
            ),
          ],
        ),
      ),
    );
  }
}
