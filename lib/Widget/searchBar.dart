// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SearchBarHeader extends StatelessWidget {
  const SearchBarHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12.h,
      child: Stack(
        children: [
          Container(
            height: 10.h,
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              margin: EdgeInsets.symmetric(horizontal: 3.w),
              height: 8.h,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Search by Company Name',
                  hintStyle: TextStyle(),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  suffixIcon: Icon(Icons.search),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: Colors.blueAccent.withOpacity(0.50),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
