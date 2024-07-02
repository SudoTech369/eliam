import 'package:flutter/material.dart';
import 'package:eliam/widgets/appbar_widgets.dart';

class BalanceScreen extends StatelessWidget {
  const BalanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const AppBarTitle(title: 'Supplier Balance'),
        leading: const AppBarBackButton(),
      ),
    );
  }
}
