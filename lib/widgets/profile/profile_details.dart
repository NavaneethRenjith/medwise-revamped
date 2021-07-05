import 'package:flutter/material.dart';

import '../../models/profile.dart';

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
