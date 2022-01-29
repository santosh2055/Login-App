// ignore_for_file: prefer_const_constructors
//This drawer is used in
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppDrawer extends StatelessWidget {
  final _auth = FirebaseAuth.instance;

  AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(_auth.currentUser!.email.toString(),
                          style: GoogleFonts.emilysCandy(
                              fontSize: 18, color: Colors.white))
                    ],
                  ),
                ),
                // child: Text(_auth.currentUser!.email.toString()),
                height: MediaQuery.of(context).size.height * 0.2,
                width: double.infinity,
                color: Colors.blueAccent,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        children: [
                          Text(
                            'Log Out',
                            style: GoogleFonts.lato(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          Spacer(),
                          IconButton(
                              onPressed: () async {
                                try {
                                  await _auth.signOut();
                                  Navigator.pushReplacementNamed(
                                      context, '/WelcomeScreen');
                                } on FirebaseAuthException catch (e) {
                                  print(e.message);
                                }
                              },
                              icon: Icon(Icons.logout))
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 0.2,
                    ),
                    SizedBox()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
