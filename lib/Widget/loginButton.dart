import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

//login.dart page login button
Color newAccontlink = Color(0xff);

class LoginButton extends StatelessWidget {
  final title;
   dynamic ontap;
   LoginButton({required this.title,required this.ontap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Colors.black26),
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.inter(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xff202020)),
          ),
        ),
      ),
    );
  }
}
