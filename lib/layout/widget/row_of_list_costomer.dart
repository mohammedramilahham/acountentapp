import 'package:acountent/shared/colors.dart';
import 'package:acountent/shared/component.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

// ignore: must_be_immutable
class RowOfCustomer extends StatelessWidget {
  String name;
  int price;
  String date;
  int delete = 0;

  RowOfCustomer({this.name, this.price, this.date});

  @override
  Widget build(BuildContext context) {
    final formatter = intl.NumberFormat.decimalPattern();
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [cyan, bluedark],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    color: Colors.indigo,
                  ),
                ),
                title: defaulttext(15, FontWeight.bold, Colors.yellow, name),
              ),
            ),
            Expanded(
                child: defaulttext(15, FontWeight.bold, Colors.yellow,
                    formatter.format(price))),
            Expanded(
              child: Container(
                child: defaulttext(13, FontWeight.bold, Colors.white, date),
              ),
            ),
            Expanded(
                child: Container(
              width: 30,
              decoration: BoxDecoration(
                  color: bluemod, borderRadius: BorderRadius.circular(20)),
              child: IconButton(
                color: Colors.yellow,
                onPressed: () {
                  /*  showDialog(
                      context: context,
                      builder: (context) => showdialogalert(
                            a: () {},
                            b: () {
                              delete = 1;
                            },
                          ));*/
                },
                icon: Icon(Icons.add),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
