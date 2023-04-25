// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toy_app/representation/models/delivery_address_model.dart';
import 'package:toy_app/representation/providers/user_provider.dart';
import 'package:toy_app/representation/screen/check_out/add_delivery_address/delivery_detail.dart';
import 'package:toy_app/representation/screen/review_cart/review_cart.dart';
import 'package:toy_app/representation/widget/drawer.dart';

class MyProfile extends StatefulWidget {
  UserProvider userProvider;

  MyProfile({
    Key? key,
    required this.userProvider,
  }) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  Widget listTile(
      {required IconData icon,
      required String title,
      required VoidCallback onTap}) {
    return Column(
      children: [
        const Divider(height: 1),
        ListTile(
          onTap: onTap,
          leading: Icon(
            icon,
            size: 32,
          ),
          title: Text(
            title,
            style: const TextStyle(color: Colors.black45),
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of(context);
    var userData = widget.userProvider.currentUserData;
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0.0,
        title: const Text(
          'My Profile',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
      drawer: DrawerWidget(
        userProvider: userProvider,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Container(),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 250,
                            height: 80,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      userData.userName,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      userData.userEmail,
                                      style: const TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    ),
                                  ],
                                ),
                                const CircleAvatar(
                                  radius: 12,
                                  backgroundColor: Colors.grey,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 10,
                                    child: Icon(
                                      Icons.edit,
                                      color: Colors.grey,
                                      size: 17,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      listTile(
                          icon: Icons.shop_outlined,
                          title: 'My Orders',
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ReviewCart(),
                              ),
                            );
                          }),
                      listTile(
                          icon: Icons.location_on_outlined,
                          title: 'My Delivery Address',
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => DeliveryDetail(),
                              ),
                            );
                          }),
                      listTile(
                          icon: Icons.person_outline,
                          title: 'Refer A friends',
                          onTap: () {}),
                      listTile(
                          icon: Icons.file_copy_outlined,
                          title: 'Terms & Conditions',
                          onTap: () {}),
                      listTile(
                          icon: Icons.policy_outlined,
                          title: 'Privacy Policy',
                          onTap: () {}),
                      listTile(
                          icon: Icons.add_chart, title: 'About', onTap: () {}),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 20),
            child: CircleAvatar(
              radius: 55,
              backgroundColor: Colors.orange,
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.greenAccent,
                backgroundImage: NetworkImage(
                  userData.userImage ??
                      'https://firebasestorage.googleapis.com/v0/b/toystore-625a1.appspot.com/o/project01%2Ffavpng_user-profile-password-login.png?alt=media&token=c786e220-7556-4cc1-89dc-e752720fe909',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
