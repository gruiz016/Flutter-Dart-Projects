import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';

class CartItems extends StatelessWidget {
  final String id;
  final double price;
  final int quantity;
  final String title;
  final String productId;

  CartItems({
    @required this.quantity,
    @required this.price,
    @required this.id,
    @required this.title,
    @required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      key: ValueKey(id),
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      background: Container(
        padding: EdgeInsets.only(right: 10),
        alignment: Alignment.centerRight,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        color: Theme.of(context).accentColor,
      ),
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        elevation: 6,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: Text('\$$price'),
            ),
            title: Text(title),
            subtitle: Text('\$${(price * quantity).toStringAsFixed(0)}'),
            trailing: Text('${quantity.toStringAsFixed(0)} x'),
          ),
        ),
      ),
    );
  }
}
