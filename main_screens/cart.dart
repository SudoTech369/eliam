import "package:eliam/providers/cart_provider.dart";
import "package:eliam/widgets/alert_dialog.dart";
import "package:flutter/material.dart";
// import "package:eliam/main_screens/customer_home.dart";
import "package:eliam/widgets/appbar_widgets.dart";
import "package:eliam/widgets/yellow_button.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  final Widget? back;
  const CartScreen({Key? key, this.back}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: widget.back,
        title: const AppBarTitle(title: "Cart"),
        actions: [
          context.watch<Cart>().getItems.isEmpty
              ? const SizedBox()
              : IconButton(
                  onPressed: () {
                    MyAlertDialog.showMyDialog(
                      context: context,
                      title: 'clear cart',
                      content: 'Are you sure you want to clear cart',
                      tabNo: () {
                        Navigator.pop(context);
                      },
                      tabYes: () {
                        context.read<Cart>().clearCart();
                        Navigator.pop(context);
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.delete_forever,
                    color: Colors.black,
                  ),
                ),
        ],
      ),
      body: context.watch<Cart>().getItems.isNotEmpty
          ? const CartItems()
          : const EmptyCart(),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Text(
                  "Total:  Ksh ",
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  context.watch<Cart>().totalPrice.toStringAsFixed(2),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            YellowButton(
              onPressed: () {},
              label: "CHECK OUT",
              width: 0.45,
            ),
          ],
        ),
      ),
    );
  }
}

class EmptyCart extends StatelessWidget {
  const EmptyCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Your cart is empty!",
            style: TextStyle(fontSize: 30),
          ),
          const SizedBox(
            height: 50,
          ),
          Material(
            color: Colors.lightBlueAccent,
            borderRadius: BorderRadius.circular(25),
            child: MaterialButton(
              minWidth: MediaQuery.of(context).size.width * 0.6,
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/customer_home');
              },
              child: const Text(
                "Continue Shopping",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CartItems extends StatelessWidget {
  const CartItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) {
        return ListView.builder(
            itemCount: cart.count,
            itemBuilder: (context, index) {
              final product = cart.getItems[index];
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Card(
                  child: SizedBox(
                    height: 100,
                    child: Row(
                      children: [
                        SizedBox(
                          height: 100,
                          width: 120,
                          child: Image.network(product.imagesUrl.first),
                        ),
                        Flexible(
                            child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                product.name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey.shade700),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    product.price.toStringAsFixed(2),
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red),
                                  ),
                                  Container(
                                    height: 35,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Row(children: [
                                      product.qty == 1
                                          ? IconButton(
                                              onPressed: () {
                                                cart.removeItem(product);
                                              },
                                              icon: const Icon(
                                                Icons.delete_forever,
                                                size: 18,
                                              ))
                                          : IconButton(
                                              onPressed: () {
                                                cart.reduceByOne(product);
                                              },
                                              icon: const Icon(
                                                FontAwesomeIcons.minus,
                                                size: 18,
                                              )),
                                      Text(
                                        product.qty.toString(),
                                        style: product.qty == product.qntty
                                            ? const TextStyle(
                                                fontSize: 20,
                                                color: Colors.red,
                                              )
                                            : const TextStyle(
                                                fontSize: 20,
                                              ),
                                      ),
                                      IconButton(
                                          onPressed:
                                              product.qty == product.qntty
                                                  ? null
                                                  : () {
                                                      cart.increment(product);
                                                    },
                                          icon: const Icon(
                                            FontAwesomeIcons.plus,
                                            size: 18,
                                          ))
                                    ]),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ))
                      ],
                    ),
                  ),
                ),
              );
            });
      },
    );
  }
}
