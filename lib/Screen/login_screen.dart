// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:login_app/Screen/Home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_app/Utils/constant.dart';
import 'package:login_app/Utils/lodingIndicator.dart';
import 'package:login_app/Widget/loginButton.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  String email = '';
  String password = '';
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: isloading
              ? Loading()
              : Form(
                  key: formkey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.2.h),
                          child: Container(
                            height: 25.h,
                            width: 65.w,
                            child: Image.asset('images/LoginPageImage1.png',
                                fit: BoxFit.cover),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 3.5.w,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 3.5.h),
                                Text(
                                  'Email',
                                  style: ktextfieldtitlestyle,
                                ),
                                SizedBox(height: 1.5.h),
                                Container(
                                  height: 10.h,
                                  width: double.infinity,
                                  child: TextFormField(
                                    onChanged: (value) {
                                      setState(() {
                                        email = value;
                                      });
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return " Enter Email";
                                      }
                                    },
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: ktextfielddecoration.copyWith(
                                      hintText: ' Enter your Email',
                                      prefixIcon: Icon(
                                        Icons.email,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 2.5.h),
                                Text('Password', style: ktextfieldtitlestyle),
                                SizedBox(height: 1.5.h),
                                Container(
                                  height: 10.h,
                                  child: TextFormField(
                                    onChanged: (value) {
                                      setState(() {
                                        password = value;
                                      });
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return " Enter Password";
                                      }
                                    },
                                    obscureText: true,
                                    decoration: ktextfielddecoration.copyWith(
                                        prefixIcon: Icon(
                                          Icons.lock,
                                          color: Colors.black,
                                        ),
                                        hintText: ' Enter your Password'),
                                  ),
                                ),
                                SizedBox(height: 9.h),
                                SizedBox(
                                  height: 6.h,
                                  child: LoginButton(
                                    title: 'Login',
                                    ontap: () async {
                                      if (formkey.currentState!.validate()) {
                                        setState(() {
                                          isloading = true;
                                        });
                                        try {
                                          final user = await _auth
                                              .signInWithEmailAndPassword(
                                                  email: email,
                                                  password: password);
                                          if (user != null) {
                                            await Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (contex) =>
                                                    HomeScreen(),
                                              ),
                                            );
                                          }
                                          setState(() {
                                            isloading = false;
                                          });
                                        } on FirebaseAuthException catch (e) {
                                          showDialog(
                                            context: context,
                                            builder: (ctx) => AlertDialog(
                                              title: Text("Ops! Login Failed"),
                                              content: Text('${e.message}'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(ctx).pop();
                                                  },
                                                  child: Text('Okay'),
                                                )
                                              ],
                                            ),
                                          );
                                          print(e);
                                        }
                                        setState(() {
                                          isloading = false;
                                        });
                                      }
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )),
    );
  }
}
