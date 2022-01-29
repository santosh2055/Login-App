// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:login_app/Widget/bottomNavbar.dart';

class LearnMoreScreen extends StatelessWidget {
  const LearnMoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 3,
      ),
    );
  }
}
