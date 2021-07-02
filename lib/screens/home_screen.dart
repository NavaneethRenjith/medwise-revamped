import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './task_screen.dart';
import './connect_screen.dart';

import '../theme/theme.dart';
import '../widgets/home_screen_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
        title: Text(
          'Medwise',
          style: TextStyle(color: blue),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.account_circle_sharp,
              color: blue,
            ),
            onPressed: () {
              //! Temporary solution for loging out, until profile page is created
              FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
      backgroundColor: background,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            child: Text(
              'Hello,',
              style: TextStyle(
                fontSize: 16,
                color: Color.fromRGBO(67, 67, 67, 1),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: 34,
            ),
            child: Text(
              //! Display name dynamically
              'Jacob',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 10,
              bottom: MediaQuery.of(context).size.height / 20,
            ),
            height: MediaQuery.of(context).size.height / 4,
            child: SvgPicture.asset(
              'assets/images/doctor_image.svg',
              alignment: Alignment.centerRight,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                ConnectScreen.routeName,
              );
            },
            child: HomeScreenWidget(
              heading: 'Connect',
              desc: 'Connect with specialist doctors nearby',
              imageLoc: 'assets/images/connect.png',
              containerColor: green,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                TaskScreen.routeName,
              );
            },
            child: HomeScreenWidget(
              heading: 'Task',
              desc: 'Manage your daily tasks and goals',
              imageLoc: 'assets/images/task.png',
              containerColor: blue,
            ),
          ),
          HomeScreenWidget(
            heading: 'Analysis',
            desc: 'How punctual were you in completing tasks',
            imageLoc: 'assets/images/analysis.png',
            containerColor: purple,
          ),
          HomeScreenWidget(
            heading: 'History',
            desc: 'Keep track of your medical history',
            imageLoc: 'assets/images/history.png',
            containerColor: orange,
          ),
        ],
      ),
    );
  }
}
