import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_app/Screen/Login_screen.dart';
import 'package:login_app/Utils/constant.dart';
import 'package:login_app/Utils/lodingIndicator.dart';
import 'package:login_app/Widget/loginButton.dart';
import 'package:sizer/sizer.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
                              Text('Email', style: ktextfieldtitlestyle),
                              SizedBox(height: 1.5.h),
                              Container(
                                height: 10.h,
                                width: double.infinity,
                                child: TextFormField(
                                  onChanged: (value) {
                                    email = value;
                                  },
                                  validator: (value) => (value!.isEmpty)
                                      ? ' Please enter email'
                                      : null,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: ktextfielddecoration.copyWith(
                                    hintText: ' Your Email',
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
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return " Please Enter  Password";
                                    }
                                  },
                                  onChanged: (value) {
                                    password = value;
                                  },
                                  obscureText: true,
                                  decoration: ktextfielddecoration.copyWith(
                                      prefixIcon: Icon(
                                        Icons.lock,
                                        color: Colors.black,
                                      ),
                                      hintText: ' Choose your Password'),
                                ),
                              ),
                              SizedBox(height: 9.h),
                              Container(
                                height: 6.h,
                                child: LoginButton(
                                  title: 'Register',
                                  ontap: () async {
                                    if (formkey.currentState!.validate()) {
                                      setState(() {
                                        isloading = true;
                                      });
                                      try {
                                        final newUser = await _auth
                                            .createUserWithEmailAndPassword(
                                                email: email,
                                                password: password);
                                        if (newUser != null) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              backgroundColor:
                                                  Colors.blueAccent,
                                              content: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                    'Sucessfully Register.You Can Login Now'),
                                              ),
                                              duration: Duration(seconds: 5),
                                            ),
                                          );
                                          await Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginScreen(),
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
                                            title: Text(
                                                ' Ops! Registration Failed'),
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
              ),
      ),
    );
  }
}
