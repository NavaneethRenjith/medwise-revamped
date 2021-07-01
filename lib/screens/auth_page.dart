import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medwise/widgets/auth_form.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;
  var _isLoading = false;

  void _submitAuthForm(String name, String email, String phone, String dob,
      String password, bool isLogin, BuildContext ctx) async {
    UserCredential userCredential;
    try {
      setState(() {
        _isLoading = true;
      });
      if (isLogin) {
        userCredential = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
      } else {
        userCredential = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        await FirebaseFirestore.instance
            .collection('users/${userCredential.user!.uid}')
            .add({
          'name': name,
          'email': email,
          'phone_number': phone,
          'dob': dob
        });

        print("success");
      }
    } on PlatformException catch (err) {
      var message = 'An error occured please check your credentials';

      if (err.message != null) {
        message = err.message!;
      }
      Scaffold.of(ctx).showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(context).errorColor,
      ));
      setState(() {
        _isLoading = false;
      });
    } catch (err) {
      print(err);
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print("auth screen");
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: Text(
          "Medwise",
          style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 22),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: AuthForm(_submitAuthForm, _isLoading),
    );
  }
}
