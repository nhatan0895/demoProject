import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project/models/product.dart';

class DetailMovies2 extends StatefulWidget {
  DetailMovies2(this.product, {Key? key}) : super(key: key);
  Product product;
  @override
  State<DetailMovies2> createState() => _DetailMovies2State();
}

class _DetailMovies2State extends State<DetailMovies2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          widget.product.title!,
          style: const TextStyle(
              color: Colors.yellowAccent,
              fontSize: 18,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: Stack(
        children: [
          Opacity(
            opacity: 0.4,
            child: Image.asset(
              widget.product.url!,
              width: double.infinity,
              height: 280,
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 40, left: 10, top: 80),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.red.withOpacity(0.6),
                                spreadRadius: 6,
                                blurRadius: 8,
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              widget.product.url!,
                              fit: BoxFit.cover,
                              height: 280,
                              width: 180,
                            ),
                          ),
                        ),
                        Expanded(child: Container()),
                        Container(
                          margin: const EdgeInsets.only(top: 210),
                          height: 40,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: RawMaterialButton(
                            onPressed: () {},
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6)),
                            fillColor: Colors.redAccent,
                            child: const Text(
                              "ĐẶT VÉ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    widget.product.description!,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.w400,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
