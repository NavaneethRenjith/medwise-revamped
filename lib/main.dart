import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './screens/home_page.dart';
import './screens/task_screen.dart';
import './screens/connect_screen.dart';
import 'screens/auth_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'medwise',
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, userSnapshot) {
          if (userSnapshot.hasData) {
            print(userSnapshot);
            return HomePage();
          }
          return AuthScreen();
        },
      ),
      routes: {
        TaskScreen.routeName: (ctx) => TaskScreen(),
        ConnectScreen.routeName: (ctx) => ConnectScreen(),
      },
    );
  }
}
