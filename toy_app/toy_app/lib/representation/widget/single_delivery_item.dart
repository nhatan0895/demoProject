import 'package:flutter/material.dart';

class SingleDeliveryItem extends StatelessWidget {
  const SingleDeliveryItem(
      {Key? key,
      required this.title,
      required this.address,
      required this.number,
      required this.addressType})
      : super(key: key);
  final String title;
  final String address;
  final String number;
  final String addressType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              Container(
                width: 70,
                padding: const EdgeInsets.all(1),
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    addressType,
                    style: const TextStyle(fontSize: 13, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          leading: const CircleAvatar(
            radius: 8,
            backgroundColor: Colors.red,
          ),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(address),
              const SizedBox(height: 5),
              Text(number),
            ],
          ),
        ),
        const Divider(height: 35),
      ],
    );
  }
}
