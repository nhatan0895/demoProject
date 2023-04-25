import 'package:flutter/material.dart';
import 'package:toy_app/representation/models/cart_model.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({Key? key, required this.e}) : super(key: key);
  final CartModel e;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        e.cartImage,
        width: 60,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            e.cartName,
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
          Text(
            e.cartUnit,
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
          Text('${e.cartPrice}K'),
        ],
      ),
      subtitle: Text('${e.cartQuantity}'),
    );
  }
}
