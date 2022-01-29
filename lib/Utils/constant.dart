// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

var kSearchtextfieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(horizontal: 3.w),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: BorderSide(color: Colors.transparent, width: 0),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: BorderSide(color: Colors.transparent, width: 0),
  ),
  hintText: 'Search',
  hintStyle: GoogleFonts.inter(
    fontSize: 11.2.sp,
    fontWeight: FontWeight.w400,
    color: Color(0xff666666),
  ),
  filled: true,
  fillColor: Color(0xffF0F0F0),
  suffixIcon: Padding(
    padding: EdgeInsets.symmetric(horizontal: 2.w),
    child: Icon(Icons.search),
  ),
  suffixIconConstraints: BoxConstraints(minWidth: 2.w, minHeight: 2.h),
);

//Used in currentIpo_screen
const KipotexDecoration = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.w400,
  color: Colors.black,
);

// for login register screen
const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  hintStyle: TextStyle(color: Colors.black),
  contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(7)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(7.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 1.5),
    borderRadius: BorderRadius.all(Radius.circular(7)),
  ),
);


// const kTextFieldDecoration = InputDecoration(
//   hintText: 'Enter a value',
//   hintStyle: TextStyle(color: Colors.black),
//   contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
//   border: OutlineInputBorder(
//     borderRadius: BorderRadius.all(Radius.circular(7)),
//   ),
//   enabledBorder: OutlineInputBorder(
//     borderSide: BorderSide(color: Colors.black, width: 0.5),
//     borderRadius: BorderRadius.all(Radius.circular(7.0)),
//   ),
//   focusedBorder: OutlineInputBorder(
//     borderSide: BorderSide(color: Colors.black, width: 0.6),
//     borderRadius: BorderRadius.all(Radius.circular(7)),
//   ),
// );

//
// const KipotexDecoration = TextStyle(
//   fontSize: 15,
//   fontWeight: FontWeight.w400,
//   color: Colors.black

// );

//Used to define textstyle used on login page

class textstyleConstant{
 static Color registerLink=Color(0xff43923A);

  static TextStyle heading = GoogleFonts.inter(
  fontWeight: FontWeight.w500, fontSize: 17.sp, color: Color(0xff202020));// Used for "Getting started!"

  static TextStyle subtitle = GoogleFonts.inter(fontSize: 10.5.sp, color: Color(0xff202020),);//used for "Connect with professionals and explore new opportunities."
}


//1.textform field decoration
var ktextfielddecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(horizontal: 3.w),
  hintText: 'User Name',
  hintStyle: GoogleFonts.inter(
    fontSize: 11.5.sp,
    fontWeight: FontWeight.w500,
    color: Color(0xff9E9E9E),
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: BorderSide(color: Color(0xff9E9E9E), width: 0.5),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: BorderSide(color: Color(0xff9E9E9E), width: 0.5),
  ),
);

//2.Textform field title style(label)
var ktextfieldtitlestyle = GoogleFonts.inter(
    fontSize: 11.5.sp, fontWeight: FontWeight.w500, color: Colors.black);
