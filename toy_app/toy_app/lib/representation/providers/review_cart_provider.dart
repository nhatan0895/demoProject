import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:toy_app/representation/models/cart_model.dart';

class ReviewCartProvider with ChangeNotifier {
  void addReviewCartData({
    required String cartId,
    required String cartImage,
    required String cartName,
    required int cartPrice,
    required int cartQuantity,
    var cartUnit,
  }) async {
    await FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourReviewCart")
        .doc(cartId)
        .set(
      {
        "cartId": cartId,
        "cartImage": cartImage,
        "cartName": cartName,
        "cartPrice": cartPrice,
        "cartQuantity": cartQuantity,
        "cartUnit": cartUnit,
        "isAdd": true,
      },
    );
  }

  void updateReviewCartData({
    required String cartId,
    required String cartImage,
    required String cartName,
    required int cartPrice,
    required int cartQuantity,
  }) async {
    await FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourReviewCart")
        .doc(cartId)
        .update(
      {
        "cartId": cartId,
        "cartImage": cartImage,
        "cartName": cartName,
        "cartPrice": cartPrice,
        "cartQuantity": cartQuantity,
        "isAdd": true,
      },
    );
  }

  List<CartModel> reviewCartDataList = [];
  void getReviewCartData() async {
    List<CartModel> newList = [];
    QuerySnapshot reviewCartValue = await FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourReviewCart")
        .get();
    for (var element in reviewCartValue.docs) {
      CartModel cartModel = CartModel(
        cartId: element.get("cartId"),
        cartImage: element.get("cartImage"),
        cartName: element.get("cartName"),
        cartPrice: element.get("cartPrice"),
        cartQuantity: element.get("cartQuantity"),
        cartUnit: element.get("cartUnit"),
      );

      newList.add(cartModel);
    }
    reviewCartDataList = newList;
    notifyListeners();
  }

  List<CartModel> get getReviewCartDataList {
    return reviewCartDataList;
  }

  ///////////////////Total Price/////////////////////////
  getTotalPrice() {
    double total = 0.0;
    for (var element in reviewCartDataList) {
      total += element.cartPrice * element.cartQuantity;
    }
    return total;
  }

  ///////////////////Cart Delete/////////////////////////
  reviewCartDataDelete(cartId) {
    FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourReviewCart")
        .doc(cartId)
        .delete();
    notifyListeners();
  }
}
