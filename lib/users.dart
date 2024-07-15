// users_screen.dart
import 'package:first_flutter_app/db/functions/db_functions.dart';
import 'package:first_flutter_app/db/model/data_model.dart';
import 'package:first_flutter_app/list_user_widget.dart';
import 'package:flutter/material.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  void initState() {
    super.initState();
    initDataBase();
    getAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(172, 225, 175, 100),
        title: const Text('Users'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: userListNotifier,
                builder: (context, value, child) {
                  return ListUserWidget(users: value);
                },
              ),
            ),
            const SizedBox(
              height: 150,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: const Text('Go to Login'),
              style: ElevatedButton.styleFrom(
                  foregroundColor: Color.fromARGB(255, 255, 255, 255),
                  backgroundColor: Color.fromARGB(255, 70, 189, 149),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  )),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/about');
              },
              child: const Text('About'),
              style: ElevatedButton.styleFrom(
                  foregroundColor: Color.fromARGB(255, 255, 255, 255),
                  backgroundColor: Color.fromARGB(255, 70, 189, 149),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}