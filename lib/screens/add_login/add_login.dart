import 'package:flutter/material.dart';

class AddLogin extends StatelessWidget {
  const AddLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add login'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  suffix: GestureDetector(
                    child: Text('OK'),
                    onTap: () {},
                  ),
                  labelText: 'Add login',
                ),
              ),
              ElevatedButton(onPressed: () {}, child: Text('Ok'))
            ],
          ),
        ),
      ),
    );
  }
}
