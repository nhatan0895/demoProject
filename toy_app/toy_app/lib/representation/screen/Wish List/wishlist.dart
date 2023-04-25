import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toy_app/representation/models/product_model.dart';
import 'package:toy_app/representation/providers/wishlist_provider.dart';
import 'package:toy_app/representation/widget/singal_item.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({Key? key}) : super(key: key);
  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  late WishlistProvider wishlistProvider;
  showAlertDialog(BuildContext context, ProductModel delete) {
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
        wishlistProvider.deleteWishlist(delete.productId);
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Wish-List"),
      content:
          const Text("Bạn có muốn xóa sản phẩm này ra khỏi WishList không?"),
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
    wishlistProvider = Provider.of(context);
    wishlistProvider.getwishlistData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          'Wish List',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: ListView.builder(
        itemCount: wishlistProvider.getWishlist.length,
        itemBuilder: (context, index) {
          ProductModel data = wishlistProvider.getWishlist[index];
          return Column(
            children: [
              const SizedBox(height: 10),
              SigalItem(
                productImage: data.productImage,
                productName: data.productName,
                productPrice: data.productPrice,
                productId: data.productId,
                isBool: false,
                onDelete: () {
                  showAlertDialog(context, data);
                },
                productUnit: data,
                productQuantity: data.productQuantity,
                wishlist: false,
              ),
              const SizedBox(height: 10),
            ],
          );
        },
      ),
    );
  }
}
