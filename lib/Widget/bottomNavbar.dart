// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int currentIndex;
  // final onItemTapped;
  const CustomBottomNavBar({Key? key, required this.currentIndex})
      : super(key: key);

  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  late int index = widget.currentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 10,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      currentIndex: index,
      onTap: (value) {
        setState(
          () {
            index = value;
            if (index == 0 && widget.currentIndex != 0) {
              Navigator.pushReplacementNamed(context, '/HomeScreen');
            } else if (index == 1 && widget.currentIndex != 1) {
              Navigator.pushReplacementNamed(context, '/CurrentIpoScreen');
            } else if (index == 2 && widget.currentIndex != 2) {
              Navigator.pushReplacementNamed(context, '/NewsScreen');
            } else if (index == 3 && widget.currentIndex != 3) {
              Navigator.pushReplacementNamed(context, '/LearnMoreScreen');
            }
          },
        );
      },
      backgroundColor: Colors.white,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            label: 'Live Market',
            icon: Icon(
              Icons.attach_money_outlined,
            )),
        BottomNavigationBarItem(
            label: 'Current Ipo',
            icon: Icon(
              Icons.inbox,
            )),
        BottomNavigationBarItem(
            label: 'News',
            icon: Icon(
              Icons.article,
            )),
        BottomNavigationBarItem(
            label: 'Learn More',
            icon: Icon(
              Icons.inbox,
            )),
      ],
    );
  }
}
