import 'package:flutter/material.dart';
import 'package:password_manager/screens/add_login/add_login.dart';
import 'package:password_manager/screens/create_pass/create_pass.dart';
import 'package:password_manager/screens/logins/views/search_login.dart';

class Logins extends StatelessWidget {
  const Logins({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddLogin(),
              ));
        },
        backgroundColor: Colors.blue.shade50,
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
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
              SizedBox(
                height: 20,
              ),
              Text('All passwords'),
              SizedBox(
                height: 20,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreatePass(),
                      ));
                },
                contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
                dense: true,
                leading: Container(
                  width: 3,
                  color: Colors.red,
                ),
                horizontalTitleGap: -15,
                title: Text(
                  'Amazon',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade600,
                  ),
                ),
                subtitle: Text('hi'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
