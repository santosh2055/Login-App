// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_app/Provider/live_nepse.dart';
import 'package:login_app/Utils/globals.dart';
import 'package:login_app/Utils/lodingIndicator.dart';
import 'package:login_app/Widget/appDrawer.dart';
import 'package:login_app/Widget/bottomNavbar.dart';
import 'package:login_app/Widget/nepseSharePriceTile.dart';
import 'package:login_app/Widget/searchBar.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Provider.of<LiveMarket>(context).fetchLiveMarketData();
    final market = Provider.of<LiveMarket>(context);
    final liveData = market.liveMarket;
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueAccent,
        title: AppTitle(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchBarHeader(),
            SizedBox(height: 5.h),
            liveData.isEmpty
                ? Loading()
                : Container(
                    height: 70.h,
                    child: ListView.builder(
                      itemCount: liveData.length,
                      itemBuilder: (context, index) => SharePriceTile(
                        companyName: liveData[index].companyName,
                        maxPrice: liveData[index].maxPrice,
                        minPrice: liveData[index].minPrice,
                        closingPrice: liveData[index].closingPrice,
                        previousClosing: liveData[index].previousClosing,
                        amount: liveData[index].amount,
                        tradedShares: liveData[index].tradedShares,
                        difference: liveData[index].difference,
                      ),
                    ),
                  )
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 0,
      ),
    );
  }
}

class AppTitle extends StatelessWidget {
  const AppTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: 'Money',
          style: GoogleFonts.inter(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white),
          children: [
            TextSpan(
              text: 'Use',
              style: GoogleFonts.inter(color: Colors.orange),
            )
          ],
        ),
      ),
    );
  }
}
