import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(172, 225, 175, 100),
        title: const Text('About'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Hi Hello , Welcome  to the about us screen',
              style: TextStyle(
                fontSize: 30,
                color: Color.fromARGB(255, 51, 247, 100),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 100,
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
                Navigator.pushNamed(context, '/users');
              },
              child: const Text('Users'),
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
            callButton(),
            const SizedBox(
              height: 50,
            ),
            urlButton(),
          ],
        ),
      ),
    );
  }
}

  Widget callButton() {
    final number = '+91 9876543210';
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Color.fromARGB(255, 255, 255, 255),
        backgroundColor: Color.fromARGB(255, 70, 189, 149),
        padding: EdgeInsets.symmetric(horizontal: 48, vertical: 12),
        textStyle: TextStyle(
          fontSize: 15,
        ),
        
      ),
      child: Text('Call'),
      onPressed: () async {
        // ignore: deprecated_member_use
        launch('tel://$number');
        //launchUrl('tel://$number' as Uri);
      },
    );
  }

  Widget urlButton() {
    final url = 'https://flutter.dev/';
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Color.fromARGB(255, 255, 255, 255),
        backgroundColor: Color.fromARGB(255, 70, 189, 149),
        padding: EdgeInsets.symmetric(horizontal: 48, vertical: 12),
        textStyle: TextStyle(
          fontSize: 15,
        ),
        
      ),
      child: Text('Go to Site'),
      onPressed: () async {
        launch(url);
      },
    );
  }