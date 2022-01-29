import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_app/Screen/login_screen.dart';
import 'package:login_app/Widget/loginButton.dart';
import 'package:sizer/sizer.dart';
import 'package:login_app/Utils/constant.dart';

class WelecomeScreen extends StatelessWidget {
  const WelecomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 1.5.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 5.5.h,
              ),
              Container(
                height: 37.h,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.h),
                  child: Image.asset('images/LoginPageImage.jpg'),
                ),
              ),
              SizedBox(
                height: 6.5.h,
              ),
              Text(
                'Get started!',
                style: textstyleConstant.heading,
              ),
              SizedBox(
                height: 2.5.h,
              ),
              Text(
                'Connect with professionals and explore new opportunities.',
                textAlign: TextAlign.center,
                style: textstyleConstant.subtitle,
              ),
              SizedBox(
                height: 6.5.h,
              ),
              SizedBox(
                width: 65.w,
                height: 5.5.h,
                child: LoginButton(
                  ontap: () {
                    Navigator.of(context).pushNamed('/LoginScreen');
                  },
                  title: 'Login',
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/SignUpScreen');
                },
                child: RichText(
                  text: TextSpan(
                      text: 'Not registered yet?',
                      style: textstyleConstant.subtitle,
                      children: <TextSpan>[
                        TextSpan(
                            text: ' Create an Account',
                            style: GoogleFonts.inter(
                              fontSize: 10.sp,
                              color: textstyleConstant.registerLink,
                            ))
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
