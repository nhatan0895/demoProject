import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toy_app/representation/models/delivery_address_model.dart';
import 'package:toy_app/representation/providers/checkout_provider.dart';
import 'package:toy_app/representation/screen/check_out/add_delivery_address/add_delivery_address.dart';
import 'package:toy_app/representation/screen/check_out/payment_summary/payment_summary.dart';
import 'package:toy_app/representation/widget/single_delivery_item.dart';

class DeliveryDetail extends StatefulWidget {
  DeliveryDetail({Key? key}) : super(key: key);

  @override
  State<DeliveryDetail> createState() => _DeliveryDetailState();
}

class _DeliveryDetailState extends State<DeliveryDetail> {
  late DeliveryAddressModel value;

  @override
  Widget build(BuildContext context) {
    CheckoutProvider deliveryAddressProvider = Provider.of(context);
    deliveryAddressProvider.getDeliveryAddressData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Chi Tiết Giao Hàng'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddDeliveryAddress(),
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        height: 48,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: MaterialButton(
          onPressed: () {
            deliveryAddressProvider.getDeliveryAddressList.isEmpty
                ? Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AddDeliveryAddress(),
                    ),
                  )
                : Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          PaymentSummary(deliveryAddressList: value),
                    ),
                  );
          },
          color: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: deliveryAddressProvider.getDeliveryAddressList.isEmpty
              ? const Text('Add New Address')
              : const Text('Payment Summary'),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            tileColor: Colors.yellow,
            title: const Text('Deliver To'),
            leading: Image.asset('assets/image/location.png', height: 30),
          ),
          const Divider(height: 1),
          deliveryAddressProvider.getDeliveryAddressList.isEmpty
              ? const Center(
                  child: Center(
                    child: Text('Không có dữ liệu'),
                  ),
                )
              : Column(
                  children: deliveryAddressProvider.getDeliveryAddressList
                      .map<Widget>((e) {
                    setState(() {
                      value = e;
                    });
                    return SingleDeliveryItem(
                      title: e.fullName,
                      address: '${e.street}, ${e.district}, ${e.city}',
                      number:
                          'SĐT: (+84) ${e.numberNo} *\n     #: (+84) ${e.anotherNumberNo}',
                      addressType: e.addressTypes == 'AddressTypes.Others'
                          ? 'Khác'
                          : e.addressTypes == 'AddressTypes.Home'
                              ? 'Nhà riêng'
                              : 'Công ty',
                    );
                  }).toList(),
                ),
        ],
      ),
    );
  }
}
