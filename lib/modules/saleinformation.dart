import 'package:acountent/shared/colors.dart';
import 'package:acountent/shared/component.dart';
import 'package:acountent/shared/hadith.dart';
import 'package:flutter/material.dart';

class Informationsale extends StatelessWidget {
  const Informationsale({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: hadith.length,
          itemBuilder: (context, i) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                padding: EdgeInsets.all(8),
                color: bluemod,
                child: Column(
                  children: [
                    defaulttext(15, FontWeight.bold, Colors.yellow, hadith[i]),
                    Divider(),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
