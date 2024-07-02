// ignore_for_file: avoid_print
// import 'dart:io';
// import 'package:eliam/main_screens/customer_home.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:eliam/auth/customer_login.dart';
// import 'package:eliam/main_screens/customer_home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:eliam/widgets/snackbar.dart';
// import 'package:eliam/main_screens/welcome_screen.dart';
import 'package:eliam/widgets/auth_widget.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage; 

class CustomerLogin extends StatefulWidget {
  const CustomerLogin({Key? key}) : super(key: key);

  @override
  State<CustomerLogin> createState() => _CustomerLoginState();
}

class _CustomerLoginState extends State<CustomerLogin> {
  // late String name;
  late String email;
  // late String profileImage;
  late String password;
  // late String _uid;
  bool processing = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
  bool passwordVisible = false;

  void logIn() async {
    setState(() {
      processing = true;
    });
    if (_formKey.currentState!.validate()) {
     
        try {
          await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password);

          // firebase_storage.Reference ref = firebase_storage
          //     .FirebaseStorage.instance
          //     .ref('cust-images/$email.jpg');

          // await ref.putFile(File(_imageFile!.path));
          // _uid = FirebaseAuth.instance.currentUser!.uid;

          // profileImage = await ref.getDownloadURL();
          // await customers.doc(_uid).set({
          //   'name': name,
          //   'email': email,
          //   'profileimage': profileImage,
          //   'phone': '',
          //   'address': '',
          //   'cid': _uid,
          // });
          _formKey.currentState!.reset();
         

          Navigator.pushReplacementNamed(
              context,
             '/customer_home');
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            setState(() {
          processing = false;
        });
            MyMessageHandler.showSnackBar(
                _scaffoldKey, 'No user found');
          } else if (e.code == 'wrong-password') {
            setState(() {
          processing = false;
        });
            MyMessageHandler.showSnackBar(
                _scaffoldKey, 'Wrong Password');
          }
        }
      
    } else {
      setState(() {
        processing = false;
      });
      MyMessageHandler.showSnackBar(_scaffoldKey, 'please fill all fields');
    }  
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _scaffoldKey,
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              reverse: true,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    //  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const AuthHeaderLabel(
                        headerLabel: 'Log In',
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                     
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'please enter your email';
                              } else if (value.isValidEmail()) {
                                return 'Invalid Email';
                              } else if (value.isValidEmail() == true) {
                                return null;
                              }
                              return null;
                            },
                            onChanged: (value) {
                              email = value;
                            },
                            // controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: textFormDecoration.copyWith(
                                labelText: 'Email',
                                hintText: 'Enter Your Email')),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'please enter your password';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              password = value;
                              // print(password);
                            },
                            // controller: _passwordController,

                            obscureText: passwordVisible,
                            decoration: textFormDecoration.copyWith(
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        passwordVisible = !passwordVisible;
                                      });
                                    },
                                    icon: Icon(
                                      passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.purple,
                                    )),
                                labelText: 'Password',
                                hintText: 'Enter Your Password')),
                      ),
                      TextButton(onPressed: (){}, child: const Text('Forgot Password ?',
                      style: TextStyle(fontSize: 18,fontStyle: FontStyle.italic),
                      )),
                      HaveAccount(
                        haveAccount: 'Don\'t Have An Account ? ',
                        actionLabel: 'Sign Up',
                        onPressed: () {
                            Navigator.pushReplacementNamed(
              context,
              '/customer_signup');
                        },
                      ),
                      processing == true
                          ? const Center(child:  CircularProgressIndicator())
                          : AuthMainButton(
                              mainButtonLabel: 'Log In',
                              onPressed: () { 
                                logIn();
                              },
                            )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
