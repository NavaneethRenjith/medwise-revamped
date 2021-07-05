import 'package:flutter/material.dart';

class ProfileDetails extends StatelessWidget {
  final String username;
  final String userEmail;
  final String userPhone;

  const ProfileDetails({
    Key? key,
    required this.username,
    required this.userEmail,
    required this.userPhone,
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
                username,
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
                "+91 $userPhone",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                userEmail,
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
