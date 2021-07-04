import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medwise/models/profile_model.dart';
import 'package:medwise/screens/profile/edit_profile.dart';

class SettingsPage extends StatelessWidget {
  final ProfileModel profileModel;
  SettingsPage({required this.profileModel});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 0,
        actions: [
          PopupMenuButton<String>(
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onSelected: null,
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
        bottom: PreferredSize(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25, 16, 20, 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Text(
                    "Settings",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
          preferredSize: Size.fromHeight(80.0),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => EditProfile(
                              profileModel: profileModel,
                            )),
                  );
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.account_box_rounded,
                      color: Colors.blue[400],
                      size: 28,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Personal info",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 18),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(
                    Icons.notifications,
                    color: Colors.blue[400],
                    size: 28,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Notifications & emails",
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
                    Icons.privacy_tip_outlined,
                    color: Colors.blue[400],
                    size: 28,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Privacy & security",
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
                    Icons.help,
                    color: Colors.blue[400],
                    size: 28,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Help & feedback",
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
              child: GestureDetector(
                onTap: () {
                  FirebaseAuth.instance.signOut().whenComplete(() {
                    Navigator.pop(context);
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.logout,
                      color: Colors.blue[400],
                      size: 28,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Log out",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 18),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(
                    Icons.settings_power_outlined,
                    color: Colors.blue[400],
                    size: 28,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Close account",
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
