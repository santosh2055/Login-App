// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SharePriceTile extends StatelessWidget {
  final String? companyName;
  final double? maxPrice;
  final double? minPrice;
  final double? closingPrice;
  final double? previousClosing;
  final double? difference;
  final int? tradedShares;
  final double? amount;

  SharePriceTile({
    this.companyName,
    this.maxPrice,
    this.minPrice,
    this.closingPrice,
    this.difference,
    this.tradedShares,
    this.amount,
    this.previousClosing,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 1.h),
      child: closingPrice! > previousClosing!
          ? Card(
              shadowColor: Colors.green,
              elevation: 10,
              color: Colors.green,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      companyName!,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(height: 7),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('MaxPrice:'),
                              SizedBox(height: 5),
                              Text('MinPrice:'),
                            ],
                          ),
                          SizedBox(width: 30),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Rs.${maxPrice.toString()}'),
                              SizedBox(height: 5),
                              Text('Rs.${minPrice.toString()}'),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          : Card(
              shadowColor: Colors.green,
              elevation: 10,
              color: Colors.redAccent,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      companyName!,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(height: 7),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'MaxPrice:',
                                style: TextStyle(),
                              ),
                              SizedBox(height: 5),
                              Text('MinPrice:'),
                            ],
                          ),
                          SizedBox(width: 30),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Rs.${maxPrice.toString()}'),
                              SizedBox(height: 5),
                              Text('Rs.${minPrice.toString()}'),
                            ],
                          ),
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
