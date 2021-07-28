import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../models/profile.dart';

import './edit_profile_screen.dart';

import '../../widgets/profile/payment_methods.dart';

enum MoreOptions {
  //Enums are a way of assigning labels to integers
  Edit,
  Logout,
}

class ProfilePage extends StatefulWidget {
  final Profile profile;

  ProfilePage({
    required this.profile,
  });

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.black38,
        elevation: 0,
        actions: [
          PopupMenuButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onSelected: (MoreOptions option) {
              if (option == MoreOptions.Edit) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => EditProfileScreen(
                      username: widget.profile.username,
                      phone: widget.profile.userPhone,
                      email: widget.profile.userEmail,
                    ),
                  ),
                );
              }
              if (option == MoreOptions.Logout) {
                FirebaseAuth.instance.signOut();
                Navigator.pop(context);
              }
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Row(
                  children: [
                    Icon(
                      Icons.edit,
                      color: Colors.black,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Edit Profile',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                value: MoreOptions.Edit,
              ),
              PopupMenuItem(
                child: Row(
                  children: [
                    Icon(
                      Icons.logout,
                      color: Colors.black,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Log Out',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                value: MoreOptions.Logout,
              ),
            ],
          ),
        ],
      ),
      backgroundColor: Colors.black38,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 20,
          ),
          child: Column(
            children: [
              ProfileDetails(
                profile: widget.profile,
              ),
              PaymentMethods(),
              ListTile(
                leading: Icon(
                  Icons.card_giftcard,
                  color: Colors.white,
                  size: 28,
                ),
                title: Text(
                  "Invite friends, get.....",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                subtitle: Text(
                  "Share your code j6je72",
                  style: TextStyle(
                    color: Colors.white54,
                  ),
                ),
                trailing: Text(
                  "Share",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Colors.white,
                  size: 28,
                ),
                title: Text(
                  "Settings",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(
                  Icons.help,
                  color: Colors.white,
                  size: 28,
                ),
                title: Text(
                  "Help and feedback",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileDetails extends StatelessWidget {
  final Profile profile;

  const ProfileDetails({
    Key? key,
    required this.profile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                profile.username,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "+91 ${profile.userPhone}",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                profile.userEmail,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 15,
                ),
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: CircleAvatar(
              radius: 42,
              backgroundColor: Colors.blue,
              // background image - profile pic of user from firebase
            ),
          ),
        ),
      ],
    );
  }
}
