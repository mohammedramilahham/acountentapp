import 'package:acountent/cubit/countent_cubit.dart';
import 'package:acountent/shared/colors.dart';

import 'package:acountent/shared/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class CreaterowBill extends StatelessWidget {
  int result;

  CreaterowBill({Key key}) : super(key: key);
  var form1 = new TextEditingController();
  var form2 = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: BlocBuilder<CountentCubit, CountentState>(
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: defaultform(
                          readonly: CountentCubit.get(context).readonlyform1,
                          control: form1,
                          txt: 'العدد',
                          color: bluedark,
                          type: TextInputType.number),
                    ),
                    Expanded(
                        child: Container(
                      alignment: Alignment.center,
                      child: defaulttext(20, FontWeight.bold, bluemod, 'x'),
                    )),
                    Expanded(
                        flex: 2,
                        child: defaultform(
                            readonly: CountentCubit.get(context).readonlyform2,
                            control: form2,
                            txt: 'السعر',
                            color: bluedark,
                            type: TextInputType.numberWithOptions())),
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.only(right: 5),
                          child: defaultbotton(
                              color: bluemod,
                              txt: '=',
                              function: () {
                                int a = int.parse(form1.text);
                                int b = int.parse(form2.text);
                                result = a * b;

                                CountentCubit.get(context).resultofrow(result);
                              }),
                        )),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
//