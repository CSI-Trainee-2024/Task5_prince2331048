import 'package:coffee_app_v2/coffeee_class.dart';

class CartItem {
  final Coffee coffee;
  int quantity;

  CartItem({required this.coffee, this.quantity = 1});
}
