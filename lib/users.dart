import 'package:first_flutter_app/db/functions/db_functions.dart';
import 'package:flutter/material.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext ctx) {
    getAllUsers();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(172, 225, 175, 100),
        title: const Text('Users'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          
            const Text(
              'Users',
              style: TextStyle(
                fontSize: 30,
                color: Color.fromARGB(255, 51, 247, 100),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 150,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(ctx, '/login');
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
                Navigator.pushNamed(ctx, '/about');
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
