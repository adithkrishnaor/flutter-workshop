//import 'dart:ffi';

import 'package:first_flutter_app/login_screen.dart';
import 'package:flutter/material.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    gotoLogin();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text('Welcome'),
    ));
  }

  @override
  void dispose(){
    super.dispose();
  }

Future<void> gotoLogin() async {
  await Future.delayed(Duration(seconds: 3));
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (ctx) => LoginScreen(),
    ),
  );
}
}