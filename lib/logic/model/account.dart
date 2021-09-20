import 'package:hive_flutter/hive_flutter.dart';
part 'account.g.dart';


@HiveType(typeId: 0)
class Account {
  Account({
    required this.name,
    required this.url,
    required this.username,
    required this.password,
    required this.notes,
  });

  @HiveField(0)
  String name;

  @HiveField(1)
  String url;

  @HiveField(2)
  String username;

  @HiveField(3)
  String password;

  @HiveField(4)
  String notes;

  @override
  String toString() {
    return '$name: ';
  }
  Account.empty():name='',notes='',password='',url='',username='';

  Account.of(
      {this.name = '',
      this.notes = '',
      this.password = '',
      this.url = '',
      this.username = ''});
}


