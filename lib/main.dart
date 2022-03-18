import 'package:acountent/modules/biiluser.dart';
import 'package:acountent/modules/list_of_customer.dart';
import 'package:acountent/modules/mainapp.dart';
import 'package:acountent/layout/widget/user.dart';

import 'package:acountent/modules/end_sum_of_bills.dart';
import 'package:acountent/modules/saleinformation.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.5
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Mainapp(), // CreateAcount(),
      routes: {
        '/user': (context) => Mainapp(),
        'users': (context) => User(),
        'SumOfBill': (context) => SumBill(),
        'ListOfCustomer': (context) => ListOfCustomer(),
        'billuser': (context) => Billuser(),
        'Informationsale': (context) => Informationsale()
      },
    );
  }
}
