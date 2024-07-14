import 'package:hive/hive.dart';
part 'data_model.g.dart';

@HiveType(typeId: 1)
class UserModel{

  @HiveField(0)
  int? id;

  @HiveField(1)
  final String username;
  
  @HiveField(2)
  final String password;

  UserModel({required this.username,required this.password,this.id});
}