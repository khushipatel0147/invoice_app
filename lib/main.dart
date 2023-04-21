import 'package:flutter/material.dart';
import 'package:invoice_app/Screen/addScreen.dart';
import 'package:invoice_app/Screen/billScreen.dart';
import 'package:invoice_app/Screen/homeScreen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomeScreen(),
        'add': (context) => AddData(),
        'bill': (context) => Bill(),
      },
    )
  );
}
