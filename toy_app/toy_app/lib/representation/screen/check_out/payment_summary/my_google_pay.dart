import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

class MyGooglePay extends StatefulWidget {
  MyGooglePay({Key? key, this.total}) : super(key: key);
  final total;

  @override
  State<MyGooglePay> createState() => _MyGooglePayState();
}

var _paymentItems = [
  const PaymentItem(
    label: 'Total',
    amount: '99.99',
    status: PaymentItemStatus.final_price,
  )
];
void onGooglePayResult(paymentResult) {
  // Send the resulting Google Pay token to your server or PSP
}

class _MyGooglePayState extends State<MyGooglePay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pay with G-Pay'),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: GooglePayButton(
          paymentConfigurationAsset: ('sample_payment_configuration.json'),
          paymentItems: [
            PaymentItem(
              label: 'Total',
              amount: '${widget.total}',
              status: PaymentItemStatus.final_price,
            )
          ],
          type: GooglePayButtonType.pay,
          onPaymentResult: onGooglePayResult,
          loadingIndicator: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
