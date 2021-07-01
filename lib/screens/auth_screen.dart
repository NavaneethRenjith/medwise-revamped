import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

import '../theme/theme.dart';
import '../widgets/auth_form.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;
  var _isLoading = false;

  void _submitAuthForm(
    String name,
    String email,
    String phone,
    String dob,
    String password,
    bool isLogin,
  ) async {
    UserCredential userCredential;

    try {
      setState(() {
        _isLoading = true;
      });

      if (isLogin) {
        userCredential = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
      } else {
        userCredential = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .set({
          'name': name,
          'email': email,
          'phone_number': phone,
          'dob': dob,
        });
      }
    } on PlatformException catch (err) {
      var message = 'An error occured please check your credentials';

      if (err.message != null) {
        message = err.message!;
      }

      //show error msg to user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );

      setState(() {
        _isLoading = false;
      });
    } on FirebaseException catch (e) {
      var message = 'An error occured!';

      if (e.message != null) message = e.message!;

      // Show error msg to user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );

      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text(
              'Medwise',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                letterSpacing: 4,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            child: Text(
              'Your personal health assistant',
              style: TextStyle(
                color: background,
              ),
            ),
          ),
          AuthForm(_submitAuthForm, _isLoading),
        ],
      ),
    );
  }
}
