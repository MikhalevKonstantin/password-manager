import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CreatePass extends StatelessWidget {
  const CreatePass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Enter pass'),
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
                    labelText: 'Enter pass',
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Ok'),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Generate pass'),
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.settings))
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
