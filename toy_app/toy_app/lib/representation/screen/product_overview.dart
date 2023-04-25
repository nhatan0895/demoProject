// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toy_app/representation/models/product_model.dart';
import 'package:toy_app/representation/providers/wishlist_provider.dart';
import 'package:toy_app/representation/screen/review_cart/review_cart.dart';
import 'package:toy_app/representation/widget/count.dart';
import 'package:toy_app/representation/widget/product_unit.dart';

enum StatusCharater { fill, outline }

class ProductOverview extends StatefulWidget {
  const ProductOverview({
    Key? key,
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.productDescription,
    required this.productId,
    required this.productUnit,
  }) : super(key: key);
  final String productImage;
  final String productName;
  final int productPrice;
  final String productDescription;
  final String productId;
  final ProductModel productUnit;

  @override
  State<ProductOverview> createState() => _ProductOverviewState();
}

class _ProductOverviewState extends State<ProductOverview> {
  var unitData;
  var firstValue;
  StatusCharater _character = StatusCharater.fill;
  Widget btNavigatorBar({
    required Color iconColor,
    required Color backgroundColor,
    required Color color,
    required String title,
    required IconData iconData,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(20),
          color: backgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                size: 20,
                color: iconColor,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                title,
                style: TextStyle(color: color),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool wishlistBool = false;
  getWishlistBool() {
    FirebaseFirestore.instance
        .collection("Wishlist")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourWishlist")
        .doc(widget.productId)
        .get()
        .then((value) => {
              if (mounted)
                {
                  if (value.exists)
                    {
                      setState(
                        () {
                          wishlistBool = value.get("wishlist");
                        },
                      ),
                    }
                }
            });
  }

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of(context);
    getWishlistBool();
    widget.productUnit.productUnit.firstWhere((element) {
      setState(() {
        firstValue = element;
      });
      return true;
    });
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          btNavigatorBar(
              iconColor: const Color(0xffd1ad17),
              backgroundColor: Colors.black54,
              color: const Color(0xffd1ad17),
              title: 'Add To Wishlist',
              iconData: wishlistBool == false
                  ? Icons.favorite_outline
                  : Icons.favorite,
              onTap: () {
                setState(() {
                  wishlistBool = !wishlistBool;
                });
                if (wishlistBool == true) {
                  wishlistProvider.addWishlistData(
                    wishlistId: widget.productId,
                    wishlistImage: widget.productImage,
                    wishlistName: widget.productName,
                    wishlistPrice: widget.productPrice,
                    // wishlistUnit: widget.productUnit,
                    wishlistQuantity: 2,
                  );
                } else {
                  wishlistProvider.deleteWishlist(widget.productId);
                }
              }),
          btNavigatorBar(
            iconColor: Colors.black54,
            backgroundColor: const Color(0xffd1ad17),
            color: Colors.black54,
            title: 'Go To Cart',
            iconData: Icons.shopping_bag,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ReviewCart(),
                ),
              );
            },
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(225, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Colors.orange,
        iconTheme: const IconThemeData(color: Colors.blueGrey),
        title: const Text(
          'Chi Tiết Sản Phẩm',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      widget.productName,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    height: 240,
                    width: 260,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      image: DecorationImage(
                        image: NetworkImage(
                          widget.productImage,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          color: Colors.yellow,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          width: double.infinity,
                          child: const Text(
                            'Available Options',
                            textAlign: TextAlign.start,
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      const SizedBox(width: 30),
                      Expanded(
                        flex: 3,
                        child: ProductUnit(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: widget.productUnit.productUnit
                                        .map<Widget>((data) {
                                      return Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 10),
                                            child: InkWell(
                                              onTap: () async {
                                                setState(() {
                                                  unitData = data;
                                                });
                                                Navigator.of(context).pop();
                                              },
                                              child: Text(
                                                data,
                                                style: const TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    }).toList(),
                                  );
                                });
                          },
                          title: unitData ?? firstValue,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 3,
                                backgroundColor: Colors.green[700],
                              ),
                              Radio(
                                value: StatusCharater.fill,
                                groupValue: _character,
                                activeColor: Colors.green[700],
                                onChanged: (value) {
                                  setState(() {
                                    _character = value as StatusCharater;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        Text(
                          '${widget.productPrice}K/ VNĐ',
                          style: const TextStyle(fontSize: 15),
                        ),
                        SizedBox(
                          height: 40,
                          width: 90,
                          child: Count(
                            productId: widget.productId,
                            productImage: widget.productImage,
                            productName: widget.productName,
                            productPrice: widget.productPrice,
                            productUnit: unitData ?? firstValue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Mô Tả Sản Phẩm:',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 10),
                    Text(widget.productDescription),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
