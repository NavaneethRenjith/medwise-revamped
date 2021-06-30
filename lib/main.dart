import 'package:flutter/material.dart';

import './screens/home_page.dart';
import './screens/task_screen.dart';
import './screens/connect_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'medwise',
      home: HomePage(),
      routes: {
        TaskScreen.routeName: (ctx) => TaskScreen(),
        ConnectScreen.routeName: (ctx) => ConnectScreen(),
      },
    );
  }
}
