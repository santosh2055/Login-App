 // ignore_for_file: non_constant_identifier_names

 import 'package:flutter/material.dart';

Row NewsScreenAppBar() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Business",
            style:
                TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
          ),
          Text(
            "News",
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
          )
        ],
      );
  }