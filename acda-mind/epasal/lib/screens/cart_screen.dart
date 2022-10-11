import 'package:epasal/providers/cart.dart' show Cart;
import 'package:epasal/providers/order.dart';
import 'package:epasal/screens/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/cart_item.dart';

void main() => runApp(const CartScreen());

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  static const routeName = 'cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text(' Your Cart'),
        ),
        body: Column(
          children: [
            Card(
              elevation: 5,
              margin: const EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    const Spacer(),
                    Chip(
                      label: Text(
                        'Rs ${cart.totalAmount}',
                        style: const TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    OrderButton(cart: cart)
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cart.item.length,
                itemBuilder: (BuildContext context, int index) {
                  return CartItem(
                      id: cart.item.values.toList()[index].id,
                      productId: cart.item.keys.toList()[index],
                      title: cart.item.values.toList()[index].title,
                      quantity: cart.item.values.toList()[index].quantity,
                      price: cart.item.values.toList()[index].price);
                },
              ),
            )
          ],
        ));
  }
}

class OrderButton extends StatefulWidget {
  const OrderButton({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  State<OrderButton> createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.cart.totalAmount <= 0 || _isLoading
          ? null
          : () async {
              setState(() {
                _isLoading = true;
              });

              await Provider.of<Orders>(context, listen: false).addOrder(
                  widget.cart.totalAmount, widget.cart.item.values.toList());
              widget.cart.clearCart();
              setState(() {
                _isLoading = false;
              });
              Navigator.of(context).pushReplacementNamed(OrderScreen.routeName);
            },
      child:
          _isLoading ? CircularProgressIndicator.adaptive() : Text('ORDER NOW'),
    );
  }
}
