import 'package:flutter/material.dart';
import 'package:eliam/widgets/appbar_widgets.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key, required AppBarBackButton back}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const AppBarTitle(title: 'Cart Screen'),
        leading: const AppBarBackButton(),
      ),
    );
  }
}
