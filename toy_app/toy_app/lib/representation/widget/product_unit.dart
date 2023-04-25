import 'package:flutter/material.dart';

class ProductUnit extends StatefulWidget {
  const ProductUnit({Key? key, required this.title, required this.onTap})
      : super(key: key);
  final VoidCallback onTap;
  final String title;

  @override
  State<ProductUnit> createState() => _ProductUnitState();
}

class _ProductUnitState extends State<ProductUnit> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.only(left: 5),
        height: 30,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blueGrey),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                '${widget.title}',
                style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
            ),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}
