import 'package:acountent/cubit/countent_cubit.dart';
import 'package:acountent/layout/widget/billuserwidget.dart';
import 'package:acountent/modules/end_sum_of_bills.dart';
import 'package:acountent/shared/colors.dart';
import 'package:acountent/shared/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl.dart' as intl;

class User extends StatelessWidget {
  String name;
  int oldaccount;
  int tag;
  User({this.name, this.oldaccount, this.tag});
  List<Widget> rowbill = [
    CreaterowBill(),
  ];
  final DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final String formatted = DateFormat('yyyy-MM-dd').format(DateTime.now());
  int sum = 0;

  @override
  Widget build(BuildContext context) {
    final formatter = intl.NumberFormat.decimalPattern();
    return Scaffold(
        body: BlocProvider(
            create: (context) => CountentCubit(),
            child: BlocConsumer<CountentCubit, CountentState>(
              listener: (context, state) {
                if (state is Endresultstate) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SumBill(
                          tag: tag,
                          result: sum,
                          name: name,
                          oldaccount: oldaccount,
                        ),
                      ));
                }
              },
              builder: (context, state) {
                return WillPopScope(
                  onWillPop: () async {
                    Navigator.of(context).pop();
                  },
                  child: SingleChildScrollView(
                    physics: ScrollPhysics(),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(color: bluemod),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('${formatted}:تاريخ $name المطلوب من السيد',
                                  style: TextStyle(
                                      color: Colors.yellow,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                        ),
                        ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: rowbill.length,
                            itemBuilder: (context, i) {
                              return Column(
                                children: [
                                  rowbill[i],
                                  Container(
                                    alignment: Alignment.center,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: [
                                              bluedark,
                                              bluemod,
                                              bluedark
                                            ],
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight),
                                        color: bluemod,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: defaulttext(
                                        20,
                                        FontWeight.bold,
                                        Colors.yellow,
                                        formatter.format(
                                            CountentCubit.get(context)
                                                .results[i])),
                                  ),
                                ],
                              );
                            }),
                        SizedBox(
                          height: 15,
                        ),
                        rowbill.length < 15
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: defaultbotton(
                                    function: () {
                                      CountentCubit.get(context)
                                          .addtolist(rowbill, CreaterowBill());
                                    },
                                    color: Colors.yellow,
                                    color1: bluemod,
                                    txt: 'اضافة سطر جديد'),
                              )
                            : Text('data'),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: defaultbotton(
                              color: Colors.yellow,
                              color1: bluemod,
                              txt: 'مجموع الفاتورة',
                              function: () {
                                CountentCubit.get(context).endresultoflist();
                                sum = CountentCubit.get(context).endresult;
                              }),
                        )
                      ],
                    ),
                  ),
                );
              },
            )));
  }
}
/* Column(
            children: [
              defaultform(
                  control: form,
                  txt: '1',
                  color: Colors.red,
                  type: TextInputType.numberWithOptions()),
              defaultform(
                  control: form2,
                  txt: '1',
                  color: Colors.red,
                  type: TextInputType.numberWithOptions()),
              defaultbotton(
                  function: () {
                    setState(() {
                      int b = int.parse(form.text) * int.parse(form2.text);
                      widget.results.add(b);
                    });
                  },
                  color: Colors.red,
                  txt: 'locky'),
              for (var i = 0; i < widget.results.length; i++)
                widget.results.isEmpty
                    ? Text('data')
                    : Row(
                        children: [
                          Text('${widget.results[i]}'),
                        ],
                      ),
            ],
          ),*/