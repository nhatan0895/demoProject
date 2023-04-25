import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toy_app/representation/models/delivery_address_model.dart';
import 'package:toy_app/representation/providers/review_cart_provider.dart';
import 'package:toy_app/representation/screen/check_out/payment_summary/my_google_pay.dart';
import 'package:toy_app/representation/screen/check_out/payment_summary/order_item.dart';
import 'package:toy_app/representation/widget/single_delivery_item.dart';

class PaymentSummary extends StatefulWidget {
  PaymentSummary({Key? key, required this.deliveryAddressList})
      : super(key: key);
  final DeliveryAddressModel deliveryAddressList;
  @override
  State<PaymentSummary> createState() => _PaymentSummaryState();
}

enum AddressTypes {
  Home,
  Work,
  Others,
}

class _PaymentSummaryState extends State<PaymentSummary> {
  var myType = AddressTypes.Home;
  @override
  Widget build(BuildContext context) {
    ReviewCartProvider reviewCartProvider = Provider.of(context);
    reviewCartProvider.getReviewCartData();
    num discount = 30;
    double discountValue;
    double? total;
    double totalPrice = reviewCartProvider.getTotalPrice();
    double shippingCharge = 40;
    if (totalPrice > 300) {
      discountValue = (totalPrice * discount) / 100;
      total = totalPrice + 40 - discountValue;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Summary'),
        backgroundColor: Colors.orange,
      ),
      bottomNavigationBar: ListTile(
        title: const Text('Tổng cộng'),
        subtitle: Text(
          '${total ?? totalPrice}00 VNĐ',
          style: TextStyle(
            color: Colors.red[900],
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        trailing: SizedBox(
          width: 160,
          child: MaterialButton(
            onPressed: () {
              myType == AddressTypes.Work
                  ? Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MyGooglePay(
                          total: total,
                        ),
                      ),
                    )
                  : Container();
            },
            color: Colors.orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Text(
              'Order',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Column(
              children: [
                SingleDeliveryItem(
                  address:
                      '${widget.deliveryAddressList.street}, ${widget.deliveryAddressList.district}, ${widget.deliveryAddressList.city}',
                  addressType: widget.deliveryAddressList.addressTypes ==
                          'AddressTypes.Others'
                      ? 'Khác'
                      : widget.deliveryAddressList.addressTypes ==
                              'AddressTypes.Home'
                          ? 'Nhà riêng'
                          : 'Công ty',
                  number:
                      'SĐT: (+84) ${widget.deliveryAddressList.numberNo} *\n     #: (+84) ${widget.deliveryAddressList.anotherNumberNo}',
                  title: widget.deliveryAddressList.fullName,
                ),
                ExpansionTile(
                  title: Text(
                      'Có ${reviewCartProvider.getReviewCartDataList.length} sản phẩm'),
                  children: reviewCartProvider.getReviewCartDataList.map((e) {
                    return OrderItem(e: e);
                  }).toList(),
                ),
                const Divider(),
                ListTile(
                  minVerticalPadding: 5,
                  leading: const Text(
                    'Giá sản phẩm',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: Text(
                    '${totalPrice}00 VNĐ',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Text(
                    'Phí vận chuyển',
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                  trailing: Text(
                    '${shippingCharge}00 VNĐ',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Text(
                    'Mã giảm giá',
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                  trailing: Text(
                    '$discount%',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(),
                const ListTile(
                  leading: Text(
                    'Phương thức thanh toán',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                RadioListTile(
                  value: AddressTypes.Home,
                  groupValue: myType,
                  title: const Text('COD (Nhận hàng rồi mới thanh toán)'),
                  onChanged: (AddressTypes? value) {
                    setState(() {
                      myType = value!;
                    });
                  },
                  secondary: const Icon(
                    Icons.money,
                    color: Colors.orange,
                  ),
                ),
                RadioListTile(
                  value: AddressTypes.Work,
                  groupValue: myType,
                  title: const Text('Online Payment'),
                  onChanged: (AddressTypes? value) {
                    setState(() {
                      myType = value!;
                    });
                  },
                  secondary: const Icon(
                    Icons.mobile_friendly,
                    color: Colors.orange,
                  ),
                ),
                RadioListTile(
                  value: AddressTypes.Others,
                  groupValue: myType,
                  title: const Text('Thẻ ngân hàng'),
                  onChanged: (AddressTypes? value) {
                    setState(() {
                      myType = value!;
                    });
                  },
                  secondary: const Icon(
                    Icons.credit_card,
                    color: Colors.orange,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
