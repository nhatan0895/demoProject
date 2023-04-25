import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:toy_app/representation/models/product_model.dart';
import 'package:toy_app/representation/widget/count.dart';

class ProductProvider with ChangeNotifier {
  late ProductModel productModel;

  List<ProductModel> search = [];
  productModels(QueryDocumentSnapshot element) {
    productModel = ProductModel(
      productDescription: element.get("productDescription"),
      productImage: element.get("productImage"),
      productName: element.get("productName"),
      productPrice: element.get("productPrice"),
      productId: element.get("productId"),
      productUnit: element.get("productUnit"),
      productQuantity: 2,
    );
    search.add(productModel);
  }

  ////////////////////////////////////////////////////////////////////////////
  List<ProductModel> modelsProductList = [];

  fatchmodelsProductData() async {
    List<ProductModel> newList = [];

    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("modelsProduct").get();

    for (var element in value.docs) {
      productModels(element);

      newList.add(productModel);
    }
    modelsProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get getmodelsProductDataList {
    return modelsProductList;
  }

  ////////////////////////////////////////////////////////////////////////////
  List<ProductModel> keychainProductList = [];

  fatchkeychainProductData() async {
    List<ProductModel> newList = [];

    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("keychainProduct").get();

    for (var element in value.docs) {
      productModels(element);
      newList.add(productModel);
    }
    keychainProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get getkeychainProductDataList {
    return keychainProductList;
  }

  ////////////////////////////////////////////////////////////////////////////
  List<ProductModel> legoProductList = [];

  fatchlegoProductData() async {
    List<ProductModel> newList = [];

    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("legoProduct").get();

    for (var element in value.docs) {
      productModels(element);
      newList.add(productModel);
    }
    legoProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get getlegoProductDataList {
    return legoProductList;
  }

  ////////////////////////////////////////////////////////////////////////////
  List<ProductModel> get getAllProductSearch {
    return search;
  }
}
