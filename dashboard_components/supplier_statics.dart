import 'package:flutter/material.dart';
import 'package:eliam/widgets/appbar_widgets.dart';

class StaticsScreen extends StatelessWidget {
  const StaticsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const AppBarTitle(title: 'Supplier Statics'),
        leading: const AppBarBackButton(),
      ),
    );
  }
}
