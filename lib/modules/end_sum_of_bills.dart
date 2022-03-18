import 'package:acountent/cubit/countent_cubit.dart';
import 'package:intl/intl.dart' as intl;
import 'package:acountent/shared/colors.dart';
import 'package:acountent/shared/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class SumBill extends StatelessWidget {
  int result;
  String name;
  int oldaccount;
  int tag;
  SumBill({this.oldaccount, this.name, this.result, this.tag});
  var form = TextEditingController();
  int pay = 0;
  int remind;

  @override
  Widget build(BuildContext context) {
    final formatter = intl.NumberFormat.decimalPattern();
    return BlocProvider(
      create: (context) => CountentCubit()..createdatabase(),
      child: Scaffold(
        body: Directionality(
            textDirection: TextDirection.rtl,
            child: BlocBuilder<CountentCubit, CountentState>(
              builder: (context, state) {
                CountentCubit.get(context).addofbill = result;
                CountentCubit.get(context).oldaccount = oldaccount;
                CountentCubit.get(context).addofall = result + oldaccount;
                CountentCubit.get(context).sumofall();

                return WillPopScope(
                  onWillPop: () {
                    CountentCubit.get(context).closedatabase();
                    Navigator.of(context)
                        .pushReplacementNamed('ListOfCustomer');
                  },
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 400,
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
                                child: defaulttext(20, FontWeight.bold,
                                    Colors.yellow, ' المطلوب من السيد  $name'),
                              ),
                              Divider(
                                color: cyan,
                                thickness: 2,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              result == 0
                                  ? Container()
                                  : Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: defaulttext(
                                                20,
                                                FontWeight.bold,
                                                Colors.yellow,
                                                'مجموع الفاتورة الحالية'),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: defaulttext(
                                                20,
                                                FontWeight.bold,
                                                Colors.yellow,
                                                formatter.format(result)),
                                          ),
                                        ),
                                      ],
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
                              SizedBox(
                                height: 20,
                              ),
                              result == 0
                                  ? Container()
                                  : Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: defaulttext(
                                                20,
                                                FontWeight.bold,
                                                Colors.yellow,
                                                'المجموع النهائي'),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                              alignment: Alignment.center,
                                              child: defaulttext(
                                                  20,
                                                  FontWeight.bold,
                                                  Colors.yellow,
                                                  formatter.format(
                                                      CountentCubit.get(context)
                                                          .addofall))),
                                        ),
                                      ],
                                    ),
                              SizedBox(
                                height: 20,
                              ),
                              defaultbotton(
                                  function: () {
                                    showDialog(
                                        context: (context),
                                        builder: (context) => showdialogalert(
                                              control: form,
                                              contentform: 'دفعة',
                                              type: TextInputType
                                                  .numberWithOptions(),
                                              a: () {
                                                String a;
                                                a = form.text;

                                                pay = int.parse(a);
                                                print(pay);

                                                Navigator.pop(context, pay);
                                              },
                                              b: () {
                                                Navigator.of(context).pop();
                                              },
                                            ));
                                  },
                                  color: cyan,
                                  txt: 'اضافة دفعة',
                                  color1: bluedark),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: defaulttext(20, FontWeight.bold,
                                          Colors.yellow, 'الباقي'),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                        alignment: Alignment.center,
                                        child: defaulttext(
                                            20,
                                            FontWeight.bold,
                                            Colors.yellow,
                                            formatter.format(remind =
                                                result + oldaccount - pay))),
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
                          function: () async {
                            tag == 1
                                ? await CountentCubit.get(context)
                                    .inserttodatabase(
                                        name: name,
                                        sum: remind,
                                        date: formatted)
                                : await CountentCubit.get(context)
                                    .updateDatabase(
                                        name: name,
                                        sum: remind,
                                        date: formatted);
                            await CountentCubit.get(context).closedatabase();
                            Navigator.of(context)
                                .pushReplacementNamed('ListOfCustomer');
                          },
                          color: Colors.yellow,
                          txt: 'حفظ',
                          color1: bluedark)
                    ],
                  ),
                );
              },
            )),
      ),
    );
  }
}

/*    defaultbotton(
                  function: () async {
                    await CountentCubit.get(context).inserttodatabase(
                        name: widget.name,
                        sum: widget.result,
                        date: widget.datenow);
                    await CountentCubit.get(context).closedatabase();
                    Navigator.of(context)
                        .pushReplacementNamed('ListOfCustomer');
                  },
                  color: Colors.red,
                  txt: 'insert')*/
