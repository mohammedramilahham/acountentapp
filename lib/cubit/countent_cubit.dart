import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';

part 'countent_state.dart';

class CountentCubit extends Cubit<CountentState> {
  CountentCubit() : super(CountentInitial());
  static CountentCubit get(context) => BlocProvider.of(context);
  var databas;
  List<Map> list = [];
  double width = 0;
  int endresult = 0;
  int sumafterpay = 0;
  int currentindexbottomnav = 0;
  bool readonlyform1 = false;
  bool readonlyform2 = false;
  int i = 0;
  int resultofall = 0;

  List<int> results = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
  ];

  void changebottomnav(int currentindex) {
    currentindexbottomnav = currentindex;
    emit(Changebottomnavstate());
  }

  void addtolist(List<Widget> r, Widget m) {
    r.add(m);

    emit(AddrowState());
  }

  void resultofrow(int result) {
    results[i] = result;

    i = i + 1;

    print(results);
    emit(ResultofrowState());
  }

  void endresultoflist() {
    for (var i = 0; i < results.length; i++) {
      endresult += results[i];
      print(endresult);
      emit(Endresultstate());
    }
  }

  void resultafterpay(int result, int pay) {
    sumafterpay = result - pay;
    emit(Sumafterpaystate());
  }

  void inserttodatabase(
      {@required String name, @required int sum, @required String date}) async {
    await databas.transaction((txn) async {
      int id1 = await txn.rawInsert(
          'INSERT INTO usersacount(name, sum, time) VALUES("$name", $sum, "$date")');
      print('inserted1: $id1,$name');
    });
    emit(Inserttodatabasestate());
    return null;
  }

  void updateDatabase(
      {@required String name, @required int sum, @required String date}) async {
    int count = await databas.rawUpdate(
        'UPDATE usersacount SET name = ?, sum=?, time = ? WHERE name = ?',
        ['$name', '$sum', '$date', '$name']);
    print('updatedatabase');
    print('updated: $count');
  }

  void createdatabase() async {
    databas = await openDatabase('useracounts.db', version: 1,
        onCreate: (database, version) async {
      database
          .execute(
              'CREATE TABLE usersacount (id INTEGER PRIMARY KEY, name TEXT, sum INTEGER, time TEXT)')
          .then((value) {
        print('databASE created');
      }).catchError((error) {
        print('${error.toString()}');
      });
    }, onOpen: (database) {
      getdatafromdatabase(database);

      print('database open');
    });
    emit(Criatedatabasestate());
  }

  Future getdatafromdatabase(databas) async {
    list = await databas.rawQuery('SELECT * FROM usersacount');
    print(list);
    emit(Getdatabaseste());
  }

  Future closedatabase() async {
    await databas.close();
  }

  void backbutton() {
    closedatabase();

    emit(Backstate());
  }

  void delete({@required String name}) async {
    await databas
        .rawDelete('DELETE FROM usersacount WHERE name = ?', ['$name']);
    print('delete');
// Close the database
    await databas.close();
  }

  int addofbill;
  int oldaccount;
  int pay = 0;
  int rimind;
  int addofall;

  void sumofall() {
    addofall = addofbill + oldaccount;
    rimind = addofall - pay;
    emit(AddofallState());
  }
}
