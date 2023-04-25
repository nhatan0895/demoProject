import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:toy_app/representation/models/product_model.dart';

class WishlistProvider with ChangeNotifier {
  void addWishlistData({
    required String wishlistId,
    required String wishlistImage,
    required String wishlistName,
    required int wishlistPrice,
    required int wishlistQuantity,
  }) async {
    await FirebaseFirestore.instance
        .collection("Wishlist")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourWishlist")
        .doc(wishlistId)
        .set(
      {
        "wishlistId": wishlistId,
        "wishlistImage": wishlistImage,
        "wishlistName": wishlistName,
        "wishlistPrice": wishlistPrice,
        "wishlistQuantity": wishlistQuantity,
        "wishlist": true,
      },
    );
  }

////////////////////Get Wishlist Data/////////////////////////
  List<ProductModel> wishlist = [];

  getwishlistData() async {
    List<ProductModel> newList = [];

    QuerySnapshot value = await FirebaseFirestore.instance
        .collection("Wishlist")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourWishlist")
        .get();
    for (var element in value.docs) {
      ProductModel productModel = ProductModel(
        productDescription: (""),
        productId: element.get("wishlistId"),
        productImage: element.get("wishlistImage"),
        productName: element.get("wishlistName"),
        productPrice: element.get("wishlistPrice"),
        productUnit: [],
        productQuantity: element.get("wishlistQuantity"),
      );
      newList.add(productModel);
    }
    wishlist = newList;
    notifyListeners();
  }

  List<ProductModel> get getWishlist {
    return wishlist;
  }

////////////////////Delete Wishlist Data/////////////////////////
  deleteWishlist(wishlistId) {
    FirebaseFirestore.instance
        .collection("Wishlist")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourWishlist")
        .doc(wishlistId)
        .delete();
    notifyListeners();
  }
}
