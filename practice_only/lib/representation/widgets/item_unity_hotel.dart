import 'package:flutter/material.dart';
import 'package:practice1/core/constants/dismension.dart';
import 'package:practice1/core/helpers/asset_helper.dart';
import 'package:practice1/core/helpers/images_helper.dart';

class ItemUnityHotel extends StatelessWidget {
  ItemUnityHotel({Key? key}) : super(key: key);

  final List<Map<String, String>> ListUtility = [
    {'icon': AssetHelper.wifi, 'name': 'Free\nWifi'},
    {'icon': AssetHelper.cashback, 'name': 'Non-\nRefundable'},
    {'icon': AssetHelper.breakfast, 'name': 'Free\nBreakfast'},
    {'icon': AssetHelper.smoking, 'name': 'Non-\nSmoking'},
  ];

  Widget _buildItemUnityHotel(String icon, String title) {
    return Column(
      children: [
        ImageHelper.loadFromAsset(icon),
        SizedBox(height: kTopPadding),
        Text(
          title,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: kDefaultPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:
            ListUtility.map((e) => _buildItemUnityHotel(e['icon']!, e['name']!))
                .toList(),
      ),
    );
  }
}
