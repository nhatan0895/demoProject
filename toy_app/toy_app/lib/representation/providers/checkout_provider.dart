import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:location/location.dart';
import 'package:toy_app/representation/models/delivery_address_model.dart';

class CheckoutProvider with ChangeNotifier {
  bool isLoading = false;

  TextEditingController fullName = TextEditingController();
  TextEditingController numberNo = TextEditingController();
  TextEditingController anotherNumberNo = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController district = TextEditingController();
  TextEditingController city = TextEditingController();
  LocationData? setLocation;

  void validator(context, myType) async {
    if (fullName.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Họ tên trống');
    } else if (numberNo.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Sđt trống');
    } else if (street.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Chưa có số nhà và tên đường');
    } else if (district.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Quận/ Huyện trống');
    } else if (city.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Tỉnh/ Thành phố trống');
    } else if (setLocation == null) {
      Fluttertoast.showToast(msg: "setLoaction is empty");
    } else {
      isLoading = true;
      notifyListeners();
      await FirebaseFirestore.instance
          .collection('AddDeliveryAddress')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .set({
        'fullName': fullName.text,
        'numberNo': numberNo.text,
        'anotherNumberNo': anotherNumberNo.text,
        'street': street.text,
        'district': district.text,
        'city': city.text,
        'addressType': myType.toString(),
      }).then((value) async {
        isLoading = false;
        await Fluttertoast.showToast(msg: 'Đã thêm địa chỉ giao hàng');
        Navigator.of(context).pop();
        notifyListeners();
      });
      notifyListeners();
    }
  }

  List<DeliveryAddressModel> deliveryAddressList = [];
  getDeliveryAddressData() async {
    List<DeliveryAddressModel> newList = [];
    late DeliveryAddressModel deliveryAddressModel;
    DocumentSnapshot _db = await FirebaseFirestore.instance
        .collection('AddDeliveryAddress')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get();
    if (_db.exists) {
      deliveryAddressModel = DeliveryAddressModel(
        addressTypes: _db.get('addressType'),
        fullName: _db.get('fullName'),
        numberNo: _db.get('numberNo'),
        anotherNumberNo: _db.get('anotherNumberNo'),
        street: _db.get('street'),
        district: _db.get('district'),
        city: _db.get('city'),
      );
      newList.add(deliveryAddressModel);
      notifyListeners();
    }
    deliveryAddressList = newList;
    notifyListeners();
  }

  List<DeliveryAddressModel> get getDeliveryAddressList {
    return deliveryAddressList;
  }
}
