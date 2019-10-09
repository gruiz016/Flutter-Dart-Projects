import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/orders.dart';
import '../widgets/orders_item.dart';
import '../widgets/app_drawer.dart';

class OrdersScreen extends StatefulWidget {
  static const routeName = '/orders';

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  var _isInit = true;

  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Orders>(context)
        ..fetchAndSetOrders().then((_) {
          setState(() {
            _isLoading = false;
          });
        });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  Future<void> _refreshOrders(BuildContext context) async {
    await Provider.of<Orders>(context).fetchAndSetOrders();
  }

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
      ),
      drawer: AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () => _refreshOrders(context),
        child: Center(
          child: _isLoading
              ? CircularProgressIndicator()
              : ListView.builder(
                  itemBuilder: (ctx, i) => OrderWidget(
                    orders: orderData.orders[i],
                  ),
                  itemCount: orderData.orders.length,
                ),
        ),
      ),
    );
  }
}
