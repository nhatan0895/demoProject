import 'package:flutter/material.dart';
import 'package:project/models/product.dart';

class Selectmovie2 extends StatefulWidget {
  Selectmovie2(this.product, this.onTap, {Key? key}) : super(key: key);
  Product product;
  Function()? onTap;
  @override
  State<Selectmovie2> createState() => _Selectmovie2State();
}

class _Selectmovie2State extends State<Selectmovie2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      margin: const EdgeInsets.only(right: 20.0),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.black),
      ),
      child: InkWell(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 220.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.black,
                  image: DecorationImage(
                    image: AssetImage(widget.product.url!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 6.0),
              Text(
                widget.product.title!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 6.0),
              Text(
                widget.product.category!,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 11.0,
                ),
              ),
              Text(
                "${widget.product.time!} phút",
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 11.0,
                ),
              ),
              Text(
                widget.product.day!,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 11.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
