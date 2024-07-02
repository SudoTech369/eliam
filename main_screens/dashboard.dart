import "package:eliam/main_screens/visit_store.dart";
import "package:eliam/widgets/alert_dialog.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:eliam/dashboard_components.dart/edit_business.dart";
import "package:eliam/dashboard_components.dart/manage_products.dart";

import "package:eliam/dashboard_components.dart/supplier_balance.dart";
import "package:eliam/dashboard_components.dart/supplier_orders.dart";
import "package:eliam/dashboard_components.dart/supplier_statics.dart";
// import "package:eliam/dashboard_components/my_store.dart";
// import "package:eliam/main_screens/welcome_screen.dart";
import "package:eliam/widgets/appbar_widgets.dart";

List<String> label = [
  "my store",
  "orders",
  "profile",
  "product",
  "balance",
  "statics"
];
List<IconData> icons = [
  Icons.store,
  Icons.shop_2_outlined,
  Icons.edit,
  Icons.settings,
  Icons.attach_money,
  Icons.show_chart,
];
List<Widget> pages =  [
  VisitStore(suppId: FirebaseAuth.instance.currentUser!.uid),
  const SupplierOrders(),
  const EditBusiness(),
  const ManageProducts(),
  const BalanceScreen(),
  const StaticsScreen(),
];

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Center(
            child: AppBarTitle(
          title: "Dashboard",
        )),

        actions: [
          IconButton(
            onPressed: () {
              MyAlertDialog.showMyDialog(
                  context: context,
                  title: 'Log Out',
                  content: 'Are you sure you want to log out ?',
                  tabNo: () {
                    Navigator.pop(context);
                  },
                  tabYes: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.pop(context);
                    Navigator.pushReplacementNamed(context, '/welcome_screen');
                  });
            },
            icon: const Icon(Icons.logout,
            color: Colors.black,
          ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: GridView.count(
          mainAxisSpacing: 50,
          crossAxisSpacing: 50,
          crossAxisCount: 2,
          children: List.generate(6, (index) {
            return Card(
                elevation: 20,
                shadowColor: Colors.purpleAccent.shade200,
                color: Colors.blueGrey.withOpacity(0.7),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      icons[index],
                      size: 50,
                      color: Colors.yellowAccent,
                    ),
                    Text(label[index].toUpperCase(),
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.yellowAccent,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 2,
                        ))
                  ],
                ));
          }),
        ),
      ),
    );
  }
}
