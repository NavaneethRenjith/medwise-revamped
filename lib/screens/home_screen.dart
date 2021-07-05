import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import './task/task_screen.dart';
import './connect/connect_screen.dart';
import 'profile/profile_page.dart';

import '../theme/theme.dart';
import '../widgets/home_screen_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _user = FirebaseAuth.instance.currentUser;
  late String _userId;

  var _username = '';
  var _userPhone = '';
  late String _userEmail;

  void _getCurrentUser() async {
    _userId = _user!.uid;

    // To pass on to profile page
    _userEmail = _user!.email!;

    final userData =
        await FirebaseFirestore.instance.collection('users').doc(_userId).get();

    setState(() {
      _username = userData.data()!['name'];
      _userPhone = userData.data()!['phone_number'];
    });
  }

  @override
  void initState() {
    _getCurrentUser();
    super.initState();
  }

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
              //! Change to named route later
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => ProfilePage(
                    username: _username,
                    userEmail: _userEmail,
                    userPhone: _userPhone,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      backgroundColor: background,
      body: _username == ''
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
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
                    _username,
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
