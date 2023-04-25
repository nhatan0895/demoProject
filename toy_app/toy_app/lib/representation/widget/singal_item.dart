// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:toy_app/representation/providers/review_cart_provider.dart';
import 'package:toy_app/representation/widget/count.dart';

class SigalItem extends StatefulWidget {
  SigalItem({
    Key? key,
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.productId,
    required this.onDelete,
    required this.isBool,
    required this.wishlist,
    required this.productUnit,
    required this.productQuantity,
  }) : super(key: key);
  bool wishlist = false;
  bool isBool = false;
  final String productImage;
  final String productName;
  final int productPrice;
  final String productId;
  final int productQuantity;
  final VoidCallback onDelete;
  var productUnit;

  @override
  State<SigalItem> createState() => _SigalItemState();
}

late ReviewCartProvider reviewCartProvider;

class _SigalItemState extends State<SigalItem> {
  late int count;
  getCount() {
    setState(() {
      count = widget.productQuantity;
    });
  }

  @override
  void initState() {
    getCount();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    reviewCartProvider = Provider.of<ReviewCartProvider>(context);
    reviewCartProvider.getReviewCartData();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 90,
                  child: Center(
                    child: Image.network(widget.productImage),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 90,
                  child: Column(
                    mainAxisAlignment: widget.isBool == false
                        ? MainAxisAlignment.spaceAround
                        : MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.productName,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${widget.productPrice}K/ VNĐ',
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      widget.isBool == false
                          ? InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          ListTile(
                                            title: const Text('Small'),
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                          ListTile(
                                            title: const Text('Large'),
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      );
                                    });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 15),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                height: 35,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                                  children: const [
                                    Expanded(
                                      child: Text(
                                        'Small',
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 14),
                                      ),
                                    ),
                                    Center(
                                      child: Icon(
                                        Icons.arrow_drop_down_rounded,
                                        size: 20,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Text(widget.productUnit.toString())
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  padding: widget.isBool == false
                      ? const EdgeInsets.symmetric(horizontal: 15, vertical: 32)
                      : const EdgeInsets.only(left: 15, right: 15),
                  child: widget.isBool == false
                      ? SizedBox(
                          height: 50,
                          width: 90,
                          child: Count(
                            productId: widget.productId,
                            productImage: widget.productImage,
                            productName: widget.productName,
                            productPrice: widget.productPrice,
                            productUnit: widget.productUnit,
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(top: 14.0),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: widget.onDelete,
                                child: const Icon(
                                  Icons.delete,
                                  size: 30,
                                  color: Colors.black54,
                                ),
                              ),
                              const SizedBox(height: 5),
                              widget.wishlist == false
                                  ? Container(
                                      height: 35,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                if (count == 1) {
                                                  Fluttertoast.showToast(
                                                    msg:
                                                        "Đây là mức giới hạn của sản phẩm",
                                                    backgroundColor:
                                                        Colors.grey,
                                                    toastLength:
                                                        Toast.LENGTH_SHORT,
                                                    gravity:
                                                        ToastGravity.CENTER,
                                                    timeInSecForIosWeb: 1,
                                                    textColor: Colors.white,
                                                    fontSize: 20.0,
                                                  );
                                                } else {
                                                  setState(() {
                                                    count--;
                                                  });
                                                  reviewCartProvider
                                                      .updateReviewCartData(
                                                    cartImage:
                                                        widget.productImage,
                                                    cartId: widget.productId,
                                                    cartName:
                                                        widget.productName,
                                                    cartPrice:
                                                        widget.productPrice,
                                                    cartQuantity: count,
                                                  );
                                                }
                                              },
                                              child: const Icon(
                                                  Icons.remove_circle,
                                                  size: 20,
                                                  color: Colors.green),
                                            ),
                                            Text(
                                              "$count",
                                              style: const TextStyle(
                                                color: Colors.orange,
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                if (count < 10) {
                                                  setState(() {
                                                    count++;
                                                  });
                                                  reviewCartProvider
                                                      .updateReviewCartData(
                                                    cartImage:
                                                        widget.productImage,
                                                    cartId: widget.productId,
                                                    cartName:
                                                        widget.productName,
                                                    cartPrice:
                                                        widget.productPrice,
                                                    cartQuantity: count,
                                                  );
                                                }
                                              },
                                              child: const Icon(
                                                  Icons.add_circle,
                                                  size: 20,
                                                  color: Colors.green),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
        widget.isBool == false
            ? Container()
            : const Divider(
                height: 1,
                color: Colors.black45,
              ),
      ],
    );
  }
}
