import 'package:flutter/material.dart';
import 'package:password_manager/screens/add_login/add_login.dart';
import 'package:password_manager/screens/logins/views/search_login.dart';

class Logins extends StatelessWidget {
  const Logins({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context, MaterialPageRoute(
            builder: (context) => AddLogin(),
          )
          );
        },
        backgroundColor: Colors.blue.shade50,
        child: Icon(Icons.add, color: Colors.black,),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue.shade50,
        title: Text(
          'My Passwords',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchLogin(),
              Text('All passwords'),



            ],
          ),
        ),
      ),
    );
  }
}
