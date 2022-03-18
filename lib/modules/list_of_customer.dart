import 'package:acountent/cubit/countent_cubit.dart';
import 'package:acountent/layout/widget/row_of_list_costomer.dart';
import 'package:acountent/layout/widget/user.dart';
import 'package:acountent/modules/biiluser.dart';
import 'package:acountent/shared/colors.dart';
import 'package:acountent/shared/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' as intl;

class ListOfCustomer extends StatefulWidget {
  ListOfCustomer({Key key}) : super(key: key);

  @override
  _ListOfCustomerState createState() => _ListOfCustomerState();
}

class _ListOfCustomerState extends State<ListOfCustomer> {
  var form = TextEditingController();

  GlobalKey<FormState> validate = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final formatter = intl.NumberFormat.decimalPattern();
    return Scaffold(
      drawer: Directionality(textDirection: TextDirection.rtl, child: Drawer()),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: BlocProvider(
            create: (context) => CountentCubit()..createdatabase(),
            child: BlocConsumer<CountentCubit, CountentState>(
              listener: (context, state) {
                if (state is Backstate) {
                  Navigator.of(context).pushReplacementNamed('/user');
                }
              },
              builder: (context, state) {
                return WillPopScope(
                    child: SingleChildScrollView(
                      physics: ScrollPhysics(),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                  height: 100,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage('images/logo.jpg'),
                                          fit: BoxFit.scaleDown))),
                              Container(
                                  padding: EdgeInsets.all(15),
                                  alignment: Alignment.center,
                                  height: 100,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: bluedark.withOpacity(0.8)),
                                  child: defaulttext(25, FontWeight.bold,
                                      Colors.yellow, 'قائمة الزبائن ')),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                    bluemod,
                                    bluedark,
                                    bluedarkk,
                                    bluemod,
                                  ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight)),
                              child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex: 2,
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: defaulttext(
                                                15,
                                                FontWeight.bold,
                                                Colors.white,
                                                'اسم الزبون'),
                                          )),
                                      Expanded(
                                          flex: 1,
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: defaulttext(
                                                15,
                                                FontWeight.bold,
                                                Colors.white,
                                                'الحساب'),
                                          )),
                                      Expanded(
                                          flex: 1,
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: defaulttext(
                                                15,
                                                FontWeight.bold,
                                                Colors.white,
                                                'التاريخ'),
                                          )),
                                      Expanded(
                                          flex: 1,
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: defaulttext(
                                                15,
                                                FontWeight.bold,
                                                Colors.white,
                                                'اضافة فاتورة'),
                                          )),
                                    ],
                                  ))),
                          ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: CountentCubit.get(context).list.length,
                              itemBuilder: (context, i) {
                                return Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        String name = CountentCubit.get(context)
                                            .list[i]['name'];
                                        int oldaccount =
                                            CountentCubit.get(context).list[i]
                                                ['sum'];
                                        String date = CountentCubit.get(context)
                                            .list[i]['time'];
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Billuser(
                                                      tag: 0,
                                                      name: name,
                                                      date: date,
                                                      oldaccount: oldaccount,
                                                    )));
                                      },
                                      child: RowOfCustomer(
                                        name:
                                            '${CountentCubit.get(context).list[i]['name']}',
                                        price: CountentCubit.get(context)
                                            .list[i]['sum'],
                                        date:
                                            '${CountentCubit.get(context).list[i]['time']}',
                                      ),
                                    ),
                                    Divider(color: Colors.indigo)
                                  ],
                                );
                              }),
                          SizedBox(
                            height: 15,
                          ),
                          defaultbotton(
                              function: () {
                                showDialog(
                                    context: (context),
                                    builder: (context) {
                                      return AlertDialog(
                                        backgroundColor: cyan,
                                        title: defaulttext(15, FontWeight.w300,
                                            Colors.indigo, 'input name'),
                                        content: Form(
                                            key: validate,
                                            child: TextFormField(
                                              readOnly: false,
                                              style: TextStyle(
                                                color: bluedark,
                                              ),
                                              cursorColor: cyan,
                                              keyboardType: TextInputType.name,
                                              controller: form,
                                              decoration: InputDecoration(
                                                  labelText: 'name',
                                                  suffix: Icon(
                                                    Icons.person,
                                                    color: bluemod,
                                                  ),
                                                  labelStyle: TextStyle(
                                                      color: bluedark),
                                                  fillColor: Colors.white,
                                                  filled: true,
                                                  focusColor: Colors.white,
                                                  hoverColor: Colors.white,
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  )),
                                              validator: (text) {
                                                if (text.isEmpty) {
                                                  return "sould not empty";
                                                } else
                                                  print('object');
                                                return null;
                                              },
                                            )),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                var formvalidate =
                                                    validate.currentState;
                                                if (formvalidate.validate()) {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              User(
                                                                tag: 1,
                                                                name: form.text,
                                                                oldaccount: 0,
                                                              )));
                                                } else
                                                  print('notvalidate');
                                              },
                                              child: Container(
                                                  alignment: Alignment.center,
                                                  height: 25,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                      color: bluedark,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: Text(
                                                    'add bills',
                                                    style: TextStyle(
                                                        color: Colors.yellow),
                                                  ))),
                                          TextButton(
                                              onPressed: () {
                                                print(form.text);
                                                Navigator.of(context).pop();
                                              },
                                              child: Container(
                                                  alignment: Alignment.center,
                                                  height: 25,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                      color: bluedark,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: Text(
                                                    'cancel',
                                                    style: TextStyle(
                                                        color: Colors.yellow),
                                                  ))),
                                        ],
                                      );
                                    });

                                /* CountentCubit.get(context)
                                    .addtolist(rowofcustomer, RowOfCustomer());*/
                              },
                              color: bluedark,
                              txt: 'اضافة زبون')
                        ],
                      ),
                    ),
                    onWillPop: () {
                      CountentCubit.get(context).backbutton();
                    });
              },
            )),
      ),
    );
  }
}
