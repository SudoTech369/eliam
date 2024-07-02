import "package:eliam/auth/customer_login.dart";
import "package:eliam/auth/supplier_login.dart";
import "package:eliam/auth/supplier_signup.dart";
import "package:eliam/providers/cart_provider.dart";
import "package:eliam/providers/wish_provider.dart";
import "package:flutter/material.dart";
import "package:eliam/auth/customer_signup.dart";
import "package:eliam/main_screens/customer_home.dart";
import "package:eliam/main_screens/supplier_home.dart";
import "package:eliam/main_screens/welcome_screen.dart";
import "package:firebase_core/firebase_core.dart";
import "package:eliam/firebase_options.dart";
import "package:provider/provider.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create:(_)=>Cart()),
      ChangeNotifierProvider(create:(_)=>Wish())
    ],
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/welcome_screen',
        debugShowCheckedModeBanner: false,

        // home:  WelcomeScreen(),

        routes: {
          '/welcome_screen': (context) => const WelcomeScreen(),
          '/customer_home': (context) => const CustomerHomeScreen(),
          '/supplier_home': (context) => const SupplierHomeScreen(),
          '/customer_signup': (context) => const CustomerRegister(),
          '/customer_login': (context) => const CustomerLogin(),
          '/supplier_login': (context) => const SupplierLogin(),
          '/supplier_signup': (context) => const SupplierRegister(),
        });
  }
}

