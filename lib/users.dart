//users_screen.dart
import 'package:first_flutter_app/db/functions/db_functions.dart';
//import 'package:first_flutter_app/db/model/data_model.dart';
//import 'package:first_flutter_app/list_user_widget.dart';
import 'package:flutter/material.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  List userdata = [];
  @override
  void initState() {
    userDetails();
    super.initState();
  }

  void userDetails() async {
    userdata = await getAllUsers();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print(userdata);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(172, 225, 175, 100),
        title: const Text('User Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "ID",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Username",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Password",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 500,
                child: ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: userdata.length,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          userdata[index]['id'].toString(),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                          userdata[index]['username'],
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                          userdata[index]['password'],
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),

              Row(children: [
                 const SizedBox(width: 50),
                TextButton(
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                    backgroundColor: WidgetStatePropertyAll(
                      Color.fromARGB(255, 165, 27, 27),
                    ),
                  ),
                  onPressed: () {
                    deleteAllUsers();
                  },
                  child: const Text(
                    'Clear Table',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(width: 50),
                TextButton(
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                    backgroundColor: WidgetStatePropertyAll(
                      Color.fromARGB(255, 78, 153, 27),
                    ),
                  ),
                  onPressed: (){
                    refreshUser();
                  },
                  child: const Text(
                    'Refresh',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ]),
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.pushNamed(context, '/login');
              //   },
              //   child: const Text('Go to Login'),
              //   style: ElevatedButton.styleFrom(
              //       foregroundColor: Color.fromARGB(255, 255, 255, 255),
              //       backgroundColor: Color.fromARGB(255, 70, 189, 149),
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(32),
              //       )),
              // ),
            ],
          ),
        ),
      ),
    );
  }
  void refreshUser() async {
  userdata = await getAllUsers();
  setState(() {});
}
}
