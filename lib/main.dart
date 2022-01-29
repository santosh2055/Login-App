import 'package:flutter/material.dart';
import 'package:login_app/Provider/ipo_information.dart';
import 'package:login_app/Provider/live_nepse.dart';
import 'package:login_app/Provider/news.dart';
import 'package:login_app/Screen/login_screen.dart';
import 'package:login_app/Screen/news_screen.dart';
import 'package:login_app/Screen/signUp_screen.dart';
import 'package:login_app/Screen/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sizer/sizer.dart';
import 'Screen/currentIpo_screen.dart';
import 'Screen/home_screen.dart';
import 'Screen/learnMore_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiProvider(
        providers: [
          // Nepse Live data provider from api
          ChangeNotifierProvider.value(
            value: LiveMarket(),
          ),
          //news provider from api
          ChangeNotifierProvider.value(
            value: News(),
          ),
          // ipo information  provider from firebase
          StreamProvider.value(
            value: DatabaseService().ipos,
            initialData: null,
            catchError: (ipos, ipo) => null,
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/WelcomeScreen',
          routes: {
            '/WelcomeScreen': (context) => WelecomeScreen(),
            '/SignUpScreen': (contex) => SignupScreen(),
            '/LoginScreen': (context) => LoginScreen(),
            '/HomeScreen': (context) => HomeScreen(),
            '/CurrentIpoScreen': (context) => CurrentIpoScreen(),
            '/NewsScreen': (context) => NewsScreen(),
            '/LearnMoreScreen': (context) => LearnMoreScreen(),
          },
        ),
      );
    });
  }
}
