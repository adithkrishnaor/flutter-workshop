
import 'package:first_flutter_app/db/model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

ValueNotifier<List<UserModel>> userListNotifier = ValueNotifier([]);

Future<void> addUser(UserModel value) async {
  final userDB = await Hive.openBox<UserModel>('user_db');
  final _id = await userDB.add(value);
  value.id=_id;
  userListNotifier.value.add(value);
  userListNotifier.notifyListeners();
}

Future<void> getAllUsers() async{
  final userDB = await Hive.openBox<UserModel>('user_db');
  userListNotifier.value.clear();
  userListNotifier.value.addAll(userDB.values);
  userListNotifier.notifyListeners();
}

Future<void> deleteUser(int id) async {
  final userDB = await Hive.openBox<UserModel>('user_db');
  userDB.delete(id);
}