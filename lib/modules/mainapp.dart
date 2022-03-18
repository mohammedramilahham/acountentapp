import 'dart:io';

import 'package:acountent/shared/colors.dart';

import 'package:acountent/shared/component.dart';
import 'package:flutter/material.dart';

class Mainapp extends StatelessWidget {
  const Mainapp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => exit(0),
      child: Scaffold(
        /* appBar: PreferredSize(
          preferredSize: Size.fromHeight(200),
          child: AppBar(
            backgroundColor: Colors.white,
          ),
        ),*/
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                bottom: 0,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: cyan,
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                bottom: 492,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/index.jpg'),
                          fit: BoxFit.cover)),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                bottom: 492,
                child: Container(
                  padding: EdgeInsets.only(bottom: 40, right: 10),
                  alignment: Alignment.bottomRight,
                  width: double.infinity,
                  color: bluedarkk.withOpacity(0.4),
                  child: Text(
                    'واجهة التطبيق الرئيسية',
                    style: TextStyle(color: Colors.yellow),
                  ),
                ),
              ),
              Positioned(
                top: 200,
                right: 75,
                left: 75,
                child: Container(
                  alignment: Alignment.center,
                  height: 250,
                  width: MediaQuery.of(context).size.width / 1.5,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [bluemod, bluemod],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListView(
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding: EdgeInsets.all(5),
                          width: 100,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [cyan, bluedark],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight),
                              borderRadius: BorderRadius.circular(30)),
                          child: Text('اختر احد المهام',
                              style: TextStyle(
                                  color: Colors.yellow,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Divider(
                        color: Colors.yellow,
                        thickness: 2,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      defaultbotton1(
                          color1: Colors.yellow,
                          function: () {
                            Navigator.of(context).pushNamed('ListOfCustomer');
                          },
                          txt: 'قائمة الزبائن'),
                      SizedBox(
                        height: 15,
                      ),
                      defaultbotton1(
                          color1: Colors.yellow,
                          function: () {
                            Navigator.of(context).pushNamed('Informationsale');
                          },
                          txt: 'علم البيوع'),
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: 592,
                  right: 30,
                  left: 30,
                  child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: bluedark,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text('eng.mohammad.rami@gmail.com',
                          style: TextStyle(
                              color: cyan,
                              fontSize: 15,
                              fontWeight: FontWeight.bold)))),
            ],
          ),
        ),
      ),
    );
  }
}
