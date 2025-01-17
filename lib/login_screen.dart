import 'package:first_flutter_app/db/functions/db_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromRGBO(172, 225, 175, 100),
          title: const Text('Login App')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Login Here',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0)),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    hintText: 'Username',
                    filled: true,
                    fillColor: Color.fromARGB(43, 255, 255, 255)),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    hintText: 'Password',
                    filled: true,
                    fillColor: Color.fromARGB(43, 255, 255, 255)),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    checkLogin(context);
                  },
                  child: const Text('Login'),
                  style: ElevatedButton.styleFrom(
                      foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                      backgroundColor: const Color.fromARGB(255, 60, 171, 231),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      )
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }

  void checkLogin(BuildContext context) {
    final _username = _usernameController.text;
    final _password = _passwordController.text;

    if(_username.isNotEmpty &&_password.isNotEmpty){
      if (_username == _password) {
        addUser(_usernameController.text, _passwordController.text);
      Navigator.pushNamed(context, '/about');
      print('$_username $_password');
    } else {
      final _errormessage = "Username and Password doesn't match";

      //can use 3 types of messages : SnackBar, Alert Dilaogue , Simple Text

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(10),
        content: Text(_errormessage),
        duration: Duration(seconds: 3),
      ));
    }
    }
    else{
      final _errormessage = "Username and Password can't be empty";
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(10),
        content: Text(_errormessage),
        duration: Duration(seconds: 3),
        ));
    }
  }
}
