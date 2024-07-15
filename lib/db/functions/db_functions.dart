
import 'package:first_flutter_app/db/model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

ValueNotifier<List<UserModel>> userListNotifier = ValueNotifier([]);

late Database _db;

Future<void> initDataBase() async{
  _db = await openDatabase(
    'user.db',
    version: 1,
    onCreate: (Database db,int version) async{
    await db.execute(
      'CREATE TABLE user (id INTEGER PRIMARY KEY,username TEXT,password TEXT)');
  },);
}

Future<void> addUser(UserModel value) async {
  // final userDB = await Hive.openBox<UserModel>('user_db');
  // final _id = await userDB.add(value);
  // value.id=_id;
  await _db.rawInsert(
    'INSERT INTO user(username,password) VALUES(?,?)',[value.username, value.password]);
  getAllUsers();
  // userListNotifier.value.add(value);
  // userListNotifier.notifyListeners();
}

Future<void> getAllUsers() async{
  // final userDB = await Hive.openBox<UserModel>('user_db');
  userListNotifier.value.clear();
  final _values = await _db.rawQuery('SELECT * FROM user');
  print(_values);
  // userListNotifier.value.addAll(userDB.values);
  userListNotifier.notifyListeners();
}

Future<void> deleteUser(int id) async {
  // final userDB = await Hive.openBox<UserModel>('user_db');
  // await userDB.delete(id);
  getAllUsers();
}