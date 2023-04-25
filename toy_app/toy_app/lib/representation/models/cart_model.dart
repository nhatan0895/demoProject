class CartModel {
  String cartId;
  String cartImage;
  String cartName;
  int cartPrice;
  int cartQuantity;
  var cartUnit;
  CartModel({
    required this.cartImage,
    required this.cartId,
    required this.cartName,
    required this.cartPrice,
    required this.cartQuantity,
    required this.cartUnit,
  });
}
