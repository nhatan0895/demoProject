import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:toy_app/representation/models/cart_model.dart';
import 'package:toy_app/representation/providers/review_cart_provider.dart';
import 'package:toy_app/representation/screen/check_out/add_delivery_address/delivery_detail.dart';
import 'package:toy_app/representation/widget/singal_item.dart';

class ReviewCart extends StatelessWidget {
  late ReviewCartProvider reviewCartProvider;

  ReviewCart({Key? key}) : super(key: key);

  showAlertDialog(BuildContext context, CartModel delete) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text("Từ Chối"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: const Text("Xóa"),
      onPressed: () {
        reviewCartProvider.reviewCartDataDelete(delete.cartId);
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Giỏ Hàng"),
      content:
          const Text("Bạn có muốn xóa sản phẩm này ra khỏi giỏ hàng không?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    reviewCartProvider = Provider.of<ReviewCartProvider>(context);
    reviewCartProvider.getReviewCartData();

    return Scaffold(
      bottomNavigationBar: ListTile(
        title: const Text('Total Amount'),
        subtitle: Text(
          ' ${reviewCartProvider.getTotalPrice()}K/VNĐ',
        ),
        trailing: SizedBox(
          width: 160,
          child: MaterialButton(
            color: Colors.orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            onPressed: () async {
              if (reviewCartProvider.getReviewCartDataList.isEmpty) {
                Fluttertoast.showToast(msg: 'No Cart Data Found');
              }
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DeliveryDetail(),
                ),
              );
            },
            child: const Text('Submit'),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          'Review Cart',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: reviewCartProvider.getReviewCartDataList.isEmpty
          ? const Center(
              child: Text('Không có sản phẩm trong giỏ hàng'),
            )
          : ListView.builder(
              itemCount: reviewCartProvider.getReviewCartDataList.length,
              itemBuilder: (context, index) {
                CartModel data =
                    reviewCartProvider.getReviewCartDataList[index];
                return Column(
                  children: [
                    const SizedBox(height: 10),
                    SigalItem(
                      productImage: data.cartImage,
                      productName: data.cartName,
                      productPrice: data.cartPrice,
                      productId: data.cartId,
                      productQuantity: data.cartQuantity,
                      isBool: true,
                      onDelete: () {
                        showAlertDialog(context, data);
                      },
                      wishlist: false,
                      productUnit: data.cartUnit,
                    ),
                    const SizedBox(height: 10),
                  ],
                );
              },
            ),
    );
  }
}
