import 'package:flutter/material.dart';
import 'package:eliam/widgets/appbar_widgets.dart';

class SupplierOrders extends StatelessWidget {
  const SupplierOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(title: 'Supplier Orders'),
        leading: const AppBarBackButton(),
      ),
    );
  }
}
