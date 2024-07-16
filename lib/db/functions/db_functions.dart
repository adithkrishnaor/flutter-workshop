//import 'package:first_flutter_app/db/model/data_model.dart';
//import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
//import 'package:path/path.dart';

//ValueNotifier<List<UserModel>> userListNotifier = ValueNotifier([]);

late Database _db;

Future<void> initDataBase() async {
  _db = await openDatabase(
    "usersdet",
    version: 1,
    onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE userdb(id INTEGER PRIMARY KEY,username TEXT,password TEXT)'
      );
    },
  );
  debugPrint('DB CREATED');
}

Future<int> addUser(String username, String password) async {
  // final userDB = await Hive.openBox<UserModel>('user_db');
  // final _id = await userDB.add(value);
  // value.id=_id;
  final adduser = await _db.rawInsert(
      'INSERT INTO userdb(username,password) VALUES(?,?)',
      [username, password]);
  return adduser; // userListNotifier.value.add(value);
  // userListNotifier.notifyListeners();
}

Future<List> getAllUsers() async {
  // final userDB = await Hive.openBox<UserModel>('user_db');
  //userListNotifier.value.clear();
  final _usrdetails = await _db.rawQuery('SELECT * FROM userdb');
  print(_usrdetails);
  // userListNotifier.value.addAll(userDB.values);
  //userListNotifier.notifyListeners();
  return _usrdetails;
}

Future<void> deleteAllUsers() async {
  await _db.delete('userdb');
  //await _db.close();
  //final dbpath = await getDatabasesPath();
   //final dbPaths = join(dbpath,'userdb.db');
   //await deleteDatabase(dbPaths);
  //getAllUsers();
}

