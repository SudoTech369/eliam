import 'package:flutter/material.dart';
import 'package:eliam/main_screens/welcome_screen.dart';

class AuthMainButton extends StatelessWidget {
  final String mainButtonLabel;
  final Function() onPressed;
  const AuthMainButton({
    Key? key,
    required this.mainButtonLabel,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Material(
          color: Colors.purple,
          borderRadius: BorderRadius.circular(25),
          child: MaterialButton(
              minWidth: double.infinity,
              onPressed: onPressed,
              child: Text(mainButtonLabel,
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)))),
    );
  }
}

class HaveAccount extends StatelessWidget {
  final String haveAccount;
  final String actionLabel;
  final Function() onPressed;
  const HaveAccount({
    Key? key,
    required this.haveAccount,
    required this.actionLabel,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(haveAccount,
            style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
        TextButton(
            onPressed: onPressed,
            child: Text(actionLabel,
                style: const TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)))
      ],
    );
  }
}

class AuthHeaderLabel extends StatelessWidget {
  final String headerLabel;
  const AuthHeaderLabel({
    Key? key,
    required this.headerLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(headerLabel,
              style:
                  const TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const WelcomeScreen()));
            },
            icon: const Icon(
              Icons.home_work,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}

var textFormDecoration = InputDecoration(
    labelText: 'Email Address',
    hintText: 'Enter your email address',
    border: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.deepPurpleAccent, width: 1),
        borderRadius: BorderRadius.circular(25)),
    focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.deepPurpleAccent, width: 2),
        borderRadius: BorderRadius.circular(25)));

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(r'^[a-zA-Z0-9]+[\-\_\.]*[a-zA-Z0-9][@][a-zA-Z0-9]{2,}[\.]$')
        .hasMatch(this);
  }
}
class MyMessageHandler {
  static void showSnackBar(var _scaffoldKey, String message) {
    _scaffoldKey.currentState!.hideCurrentSnackBar();
    _scaffoldKey.currentState!.showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 1),
        backgroundColor: Colors.yellow,
        content: Text(message,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18, color: Colors.black)),
      ),
    );
  }
}
