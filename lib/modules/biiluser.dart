import 'package:acountent/cubit/countent_cubit.dart';
import 'package:acountent/layout/widget/user.dart';
import 'package:acountent/modules/end_sum_of_bills.dart';
import 'package:acountent/shared/colors.dart';
import 'package:acountent/shared/component.dart';
import 'package:intl/intl.dart' as intl;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class Billuser extends StatelessWidget {
  int oldaccount;
  int tag;
  String name;
  String date;
  Billuser({this.name, this.oldaccount, this.tag, this.date});
  var form = TextEditingController();
  int pay = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountentCubit()..createdatabase(),
      child: BlocBuilder<CountentCubit, CountentState>(
        builder: (context, state) {
          final formatter = intl.NumberFormat.decimalPattern();
          return WillPopScope(
            onWillPop: () async {
              await CountentCubit.get(context).closedatabase();
              Navigator.of(context).pushReplacementNamed('/user');
            },
            child: Scaffold(
              body: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                              colors: [bluedark, bluemod, bluedarkk])),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: defaulttext(
                                        15,
                                        FontWeight.bold,
                                        Colors.yellow,
                                        ' المطلوب من السيد  $name'),
                                  ),
                                  Expanded(
                                    child: defaulttext(15, FontWeight.bold,
                                        Colors.yellow, '  من تاريخ  $date'),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: cyan,
                              thickness: 2,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: defaulttext(20, FontWeight.bold,
                                        Colors.yellow, 'الحساب السابق'),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                      alignment: Alignment.center,
                                      child: defaulttext(
                                          20,
                                          FontWeight.bold,
                                          Colors.yellow,
                                          formatter.format(oldaccount))),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    defaultbotton(
                      function: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => User(
                                      name: name,
                                      oldaccount: oldaccount,
                                      tag: tag,
                                    )));
                      },
                      color1: bluedarkk,
                      txt: 'اضافة فاتورة',
                      color: Colors.yellow,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    defaultbotton(
                      function: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SumBill(
                                      oldaccount: oldaccount,
                                      result: 0,
                                      name: name,
                                      tag: tag,
                                    )));
                      },
                      color1: bluedarkk,
                      txt: 'اضافة دفعة',
                      color: Colors.yellow,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    defaultbotton(
                      function: () {
                        showDialog(
                            context: context,
                            builder: (context) => BlocProvider(
                                  create: (context) =>
                                      CountentCubit()..createdatabase(),
                                  child:
                                      BlocBuilder<CountentCubit, CountentState>(
                                    builder: (context, state) {
                                      return Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: AlertDialog(
                                          title: defaulttext(
                                              25, FontWeight.bold, cyan, 'حذف'),
                                          content: defaulttext(
                                              15,
                                              FontWeight.bold,
                                              Colors.yellow,
                                              'هل تريد تاكيد عملية الحذف'),
                                          backgroundColor: bluedark,
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  CountentCubit.get(context)
                                                      .delete(name: name);
                                                  Navigator.of(context)
                                                      .pushReplacementNamed(
                                                          '/user');
                                                },
                                                child: Container(
                                                  child: defaulttext(
                                                      15,
                                                      FontWeight.bold,
                                                      Colors.yellow,
                                                      'حذف'),
                                                )),
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Container(
                                                  child: defaulttext(
                                                      15,
                                                      FontWeight.bold,
                                                      Colors.yellow,
                                                      'الغاء'),
                                                ))
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ));
                      },
                      color1: bluedarkk,
                      txt: 'حذف الحساب',
                      color: Colors.yellow,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
/*    CountentCubit.get(context).delete(name: name);
                      Navigator.of(context).pushReplacementNamed('/user');*/