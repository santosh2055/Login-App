// ignore_for_file: prefer_final_fields
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login_app/Model/sharemarket.dart';

class LiveMarket with ChangeNotifier {
  List<LiveShareMarket> _liveMarket = [];

  List<LiveShareMarket> get liveMarket {
    return [..._liveMarket];
  }

  Future<void> fetchLiveMarketData() async {
    List<LiveShareMarket> loadedData = [];
    var url =
        Uri.parse('https://nepse-data-api.herokuapp.com/data/todaysprice');

    try {
      var reponse = await http.get(url);

      if (reponse.statusCode == 200) {
        var decodeData = jsonDecode(reponse.body);
        decodeData.forEach((element) {
          loadedData.add(LiveShareMarket(
            companyName: element['companyName'],
            noOfTransactions: element['noOfTransactions'],
            maxPrice: element['maxPrice'],
            minPrice: element['minPrice'],
            closingPrice: element['closingPrice'],
            tradedShares: element['tradedShares'],
            amount: element['amount'],
            previousClosing: element['previousClosing'],
            difference: element['difference'],
          ));
        });
      }
    } on Exception catch (e) {
      // throw Exception(e.toString());
      print(e.toString());
    }
    _liveMarket = loadedData;
    notifyListeners();
  }
}
