import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toy_app/representation/providers/checkout_provider.dart';
import 'package:toy_app/representation/screen/google_map/google_map.dart';
import 'package:toy_app/representation/widget/custom_text_field.dart';

class AddDeliveryAddress extends StatefulWidget {
  AddDeliveryAddress({Key? key}) : super(key: key);

  @override
  State<AddDeliveryAddress> createState() => _AddDeliveryAddressState();
}

enum AddressTypes {
  Home,
  Work,
  Others,
}

class _AddDeliveryAddressState extends State<AddDeliveryAddress> {
  var myType = AddressTypes.Home;

  @override
  Widget build(BuildContext context) {
    CheckoutProvider checkoutProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Thêm Địa Chỉ'),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        height: 48,
        child: checkoutProvider.isLoading == false
            ? MaterialButton(
                onPressed: () {
                  checkoutProvider.validator(context, myType);
                },
                color: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Text(
                  'Add Address',
                  style: TextStyle(color: Colors.white),
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            CustomTextField(
                controller: checkoutProvider.fullName, labText: 'Họ tên*'),
            CustomTextField(
                controller: checkoutProvider.numberNo, labText: 'SĐT*'),
            CustomTextField(
              labText: 'SĐT khác',
              controller: checkoutProvider.anotherNumberNo,
            ),
            CustomTextField(
              labText: 'Số Nhà, Đường*',
              controller: checkoutProvider.street,
            ),
            CustomTextField(
              labText: 'Quận/ Huyện*',
              controller: checkoutProvider.district,
            ),
            CustomTextField(
              labText: 'Tỉnh/ Thành Phố*',
              controller: checkoutProvider.city,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CustomGoogleMap(),
                  ),
                );
              },
              child: SizedBox(
                height: 47,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    checkoutProvider.setLocation == null
                        ? const Text("Thiết lập vị trí")
                        : const Text("Done!")
                  ],
                ),
              ),
            ),
            const Divider(),
            const ListTile(
              title: Text('Address Type*'),
            ),
            RadioListTile(
              value: AddressTypes.Home,
              groupValue: myType,
              title: const Text('Nhà Riêng'),
              onChanged: (AddressTypes? value) {
                setState(() {
                  myType = value!;
                });
              },
              secondary: const Icon(
                Icons.home,
                color: Colors.orange,
              ),
            ),
            RadioListTile(
              value: AddressTypes.Work,
              groupValue: myType,
              title: const Text('Công Ty'),
              onChanged: (AddressTypes? value) {
                setState(() {
                  myType = value!;
                });
              },
              secondary: const Icon(
                Icons.work,
                color: Colors.orange,
              ),
            ),
            RadioListTile(
              value: AddressTypes.Others,
              groupValue: myType,
              title: const Text('Khác'),
              onChanged: (AddressTypes? value) {
                setState(() {
                  myType = value!;
                });
              },
              secondary: const Icon(
                Icons.other_houses,
                color: Colors.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
