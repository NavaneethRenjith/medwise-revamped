import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './edit_profile_screen.dart';

import '../theme/theme.dart';

class ProfilePage extends StatefulWidget {
  final String username;
  final String userEmail;
  final String userPhone;

  const ProfilePage({
    Key? key,
    required this.username,
    required this.userEmail,
    required this.userPhone,
  }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.black,
        title: Text(
          'PROFILE',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => EditProfile(
                    username: widget.username,
                    email: widget.userEmail,
                    phone: widget.userPhone,
                  ),
                ),
              );
            },
          )
        ],
      ),
      backgroundColor: background,
      body: Container(
        height: MediaQuery.of(context).size.height * .85,
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Icon(
                  Icons.account_circle,
                  size: 100,
                  color: Color.fromRGBO(67, 67, 67, 1),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                color: Colors.white,
                child: ListTile(
                  leading: Text(
                    'Name',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  title: Text(
                    widget.username,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                color: Colors.white,
                child: ListTile(
                  leading: Icon(Icons.phone, color: Colors.black),
                  title: Text(
                    widget.userPhone,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(Icons.email, color: Colors.black87),
                  title: Text(
                    widget.userEmail,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut().whenComplete(() {
                    Navigator.pop(context);
                  });
                },
                child: Text(
                  'Logout',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        // padding: EdgeInsets.only(top: 50),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Support',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          style: TextButton.styleFrom(
                            primary: Color.fromRGBO(67, 67, 67, 1),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Container(
                        child: TextButton(
                          onPressed: () {},
                          // height: 50,
                          child: Text(
                            'Feedback',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          style: TextButton.styleFrom(
                            primary: Color.fromRGBO(67, 67, 67, 1),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
