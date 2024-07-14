//import 'package:first_flutter_app/login_screen.dart';
import 'dart:async';

import 'package:first_flutter_app/about.dart';
import 'package:first_flutter_app/db/model/data_model.dart';
import 'package:first_flutter_app/login_screen.dart';
import 'package:first_flutter_app/splash.dart';
import 'package:first_flutter_app/users.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if(!Hive.isAdapterRegistered(UserModelAdapter().typeId))
  {
    Hive.registerAdapter(UserModelAdapter());
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromRGBO(224, 251, 226, 100)
      ),
      home: ScreenSplash(),
      routes: {
        '/about': (ctx) => AboutScreen(),
        '/login' : (ctx) => LoginScreen(),
        '/users' : (ctx) => UsersScreen()
      },
    );
  }
}

