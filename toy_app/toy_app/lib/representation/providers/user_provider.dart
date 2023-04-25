import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:toy_app/representation/models/user_model.dart';

class UserProvider with ChangeNotifier {
  void addUserData({
    required User? currentUser,
    required String? userName,
    required String? userImage,
    required String? userEmail,
  }) async {
    await FirebaseFirestore.instance
        .collection("usersData")
        .doc(currentUser?.uid)
        .set(
      {
        "userName": userName,
        "userEmail": userEmail,
        "userImage": userImage,
        "userUid": currentUser?.uid,
      },
    );
  }

  late UserModel currentData;
  Future<void> getUserData() async {
    UserModel userModel;
    var value = await FirebaseFirestore.instance
        .collection("usersData")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get();
    if (value.exists) {
      userModel = UserModel(
        userImage: value.get("userImage"),
        userUid: value.get("userUid"),
        userName: value.get("userName"),
        userEmail: value.get("userEmail"),
      );
      currentData = userModel;
      notifyListeners();
    }
  }

  UserModel get currentUserData {
    return currentData;
  }
}
