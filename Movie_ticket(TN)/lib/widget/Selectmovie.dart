import 'package:flutter/material.dart';
import 'package:project/models/product.dart';

class Selectmovie extends StatefulWidget {
  Selectmovie(this.product, this.onTap, {Key? key}) : super(key: key);
  Product product;
  Function()? onTap;
  @override
  State<Selectmovie> createState() => _SelectmovieState();
}

class _SelectmovieState extends State<Selectmovie> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      margin: EdgeInsets.only(right: 15.0),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.black),
      ),
      child: InkWell(
        onTap: widget.onTap,
        child: Padding(
          padding: EdgeInsets.all(0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 180.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.black,
                  image: DecorationImage(
                    image: AssetImage(widget.product.url!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
