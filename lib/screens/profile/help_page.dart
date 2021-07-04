import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medwise/screens/profile/settings_page.dart';

import 'edit_profile.dart';

class HelpPage extends StatefulWidget {
  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  void handleClick(String value) {
    switch (value) {
      case 'Referral code':
        break;
      case 'Get help':
        break;
      case 'Send feedback':
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Help & feedback"),
        backgroundColor: Colors.grey,
        elevation: 0,
        actions: [
          PopupMenuButton<String>(
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onSelected: handleClick,
            itemBuilder: (BuildContext context) {
              return {'Referral code', 'Get help', 'Send feedback'}
                  .map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(
                    Icons.help_outline,
                    color: Colors.blue[400],
                    size: 28,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Get help",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 18),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(
                    Icons.message,
                    color: Colors.blue[400],
                    size: 28,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Send feedback",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 18),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(
                    Icons.library_books,
                    color: Colors.blue[400],
                    size: 28,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Terms of service",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 18),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              height: 2,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(
                    Icons.lock,
                    color: Colors.blue[400],
                    size: 28,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Privacy policy",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 18),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(
                    Icons.book_online_sharp,
                    color: Colors.blue[400],
                    size: 28,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Software licenses",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 18),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    color: Colors.blue[400],
                    size: 28,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Version",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 18),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
