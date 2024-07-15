import 'package:first_flutter_app/db/functions/db_functions.dart';
import 'package:first_flutter_app/db/model/data_model.dart';
import 'package:flutter/material.dart';

class ListUserWidget extends StatelessWidget {
  const ListUserWidget({super.key, required List<UserModel> users});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: userListNotifier,
      builder: (context, List<UserModel> users, _) {
        return ListView.separated(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final data = users[index];
            return ListTile(
              title: Text(data.username),
              subtitle: Text(data.password),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
        );
      },
    );
  }
}