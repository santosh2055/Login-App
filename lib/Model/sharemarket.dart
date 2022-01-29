//for current ipo list from firebase
import 'package:flutter/material.dart';

class IPO {
  final String? companyName;
  final String? opeaningDate;
  final String? closingDate;
  final String? pricePerUnit;
  final String? totalShareUnit;
  final String? issueManager;
  final String? status;

  IPO(
      {this.companyName,
      this.opeaningDate,
      this.closingDate,
      this.pricePerUnit,
      this.totalShareUnit,
      this.issueManager,
      this.status});
}

//for current share market price listed in NEPSE from api

class ShareCurrentPrice {
  String? companyName;
  double? maxPrice;
  double? minPrice;
  double? closingPrice;
  double? difference;
  int? tradedShares;
  double? amount;
  ShareCurrentPrice({
    this.companyName,
    this.maxPrice,
    this.minPrice,
    this.closingPrice,
    this.difference,
    this.tradedShares,
    this.amount,
  });
}

// for business related news from api
class LiveShareMarket with ChangeNotifier {
  String? companyName;
  int? noOfTransactions;
  double? maxPrice;
  double? minPrice;
  double? closingPrice;
  int? tradedShares;
  double? amount;
  double? previousClosing;
  double? difference;

  LiveShareMarket({
    this.companyName,
    this.noOfTransactions,
    this.maxPrice,
    this.minPrice,
    this.closingPrice,
    this.tradedShares,
    this.amount,
    this.previousClosing,
    this.difference,
  });
}