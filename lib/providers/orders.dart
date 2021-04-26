import 'package:flutter/foundation.dart';
import 'package:shop/providers/cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;
  OrderItem({
    @required this.dateTime,
    @required this.id,
    @required this.products,
    @required this.amount,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _items = [];
  List<OrderItem> get orders {
    return [..._items];
  }

  void addOrder(List<CartItem> cartProducts, double total) {
    //
    _items.insert(
      0,
      OrderItem(
        dateTime: DateTime.now(),
        id: DateTime.now().toString(),
        products: cartProducts,
        amount: total,
      ),
    );
    notifyListeners();
  }
}
