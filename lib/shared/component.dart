import 'package:acountent/shared/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defaultform(
    {@required control,
    @required txt,
    @required Color color,
    @required TextInputType type,
    @required bool readonly,
    Function func,
    IconData suffix}) {
  return TextFormField(
    readOnly: readonly,
    style: TextStyle(
      color: Colors.indigo,
    ),
    validator: func,
    cursorColor: Colors.indigo,
    keyboardType: type,
    controller: control,
    decoration: InputDecoration(
        labelText: txt,
        suffix: Icon(suffix),
        labelStyle: TextStyle(color: color),
        fillColor: Colors.indigo,
        focusColor: Colors.indigo,
        hoverColor: Colors.indigo,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        )),
  );
}

Widget defaultbotton(
    {@required Function function,
    @required Color color,
    Color color1: Colors.white,
    @required String txt}) {
  return InkWell(
    onTap: function,
    child: Container(
      height: 50,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: bluemod.withOpacity(0.1), offset: Offset(2, 5))
        ],
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        txt,
        style:
            TextStyle(fontSize: 20, color: color1, fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Widget defaultbotton1(
    {@required Function function,
    Color color1: Colors.white,
    @required String txt}) {
  return InkWell(
    onTap: function,
    child: Container(
      height: 50,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [cyan, bluedark],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        txt,
        style:
            TextStyle(fontSize: 20, color: color1, fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Widget defaulttext(
    double fontsize, FontWeight fontwight, Color color, String txt) {
  return Text(
    txt,
    style: TextStyle(color: color, fontWeight: fontwight, fontSize: fontsize),
  );
}

Widget showdialogalert(
    {TextEditingController control,
    String contentform,
    TextInputType type,
    Function a,
    Function b}) {
  return AlertDialog(
    title: Text('اضافة دفعة'),
    content: defaultform(
        control: control,
        txt: contentform,
        color: cyan,
        type: type,
        readonly: false),
    actions: [
      TextButton(
          onPressed: a,
          child: Container(
            decoration: BoxDecoration(color: Colors.yellow),
            child: Text('اضافة'),
          )),
      TextButton(
          onPressed: b,
          child: Container(
            decoration: BoxDecoration(color: Colors.yellow),
            child: Text('الغاء'),
          ))
    ],
  );
}


  



/*InkWell(
    
    onTap: function,
    child: Container(
      height: 50,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        txt,
        style: TextStyle(
            fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    ),
  )*/