import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Text('asd'),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              color: Theme.of(context).primaryColor.withOpacity(0.1),
              child: Column(
                children: [
                  Text('asd'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
