import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medwise/screens/profile_page.dart';

import '../theme/theme.dart';
import './task_screen.dart';
import './connect_screen.dart';

class HomePage extends StatefulWidget {
  //! Display name dynamically
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _user = FirebaseAuth.instance.currentUser;

  var username = '';

  var uid;

  getCurrentUser() async {
    uid = _user!.uid;
    // Similarly we can get email as well
    //final uemail = user.email;

    //print(uemail);

    FirebaseFirestore.instance.collection('users').doc(uid).get().then((value) {
      print("checking.....");
      print(value.data);

      print(uid);
      print(_user!.uid);
      setState(() {
        username = value["name"];
      });

      // username = "jack";
    });
  }

  @override
  void initState() {
    getCurrentUser();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Medwise',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: blue,
        actions: [
          IconButton(
            icon: Icon(
              Icons.account_circle_sharp,
            ),
            onPressed: () {
              //! Temporary solution for loging out, until profile page is created
              //FirebaseAuth.instance.signOut();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProfilePage(
                        uid: _user!.uid,
                      )));
            },
          ),
        ],
      ),
      backgroundColor: background,
      body: username == ''
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: 16,
                    left: 16,
                  ),
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
                    left: 50,
                    bottom: MediaQuery.of(context).size.height * (1 / 30),
                  ),
                  child: Text(
                    //! Display name dynamically
                    username,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    //height: MediaQuery.of(context).size.height / 3,
                    child: SvgPicture.asset(
                      'assets/images/doctor_image.svg',
                      alignment: Alignment.centerRight,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * (1 / 20),
                    left: 16,
                  ),
                  child: Text(
                    'How can I help you?',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
                Expanded(
                  child: GridView.count(
                    padding: const EdgeInsets.all(16),
                    crossAxisSpacing:
                        MediaQuery.of(context).size.width * (1 / 10),
                    mainAxisSpacing: 20,
                    crossAxisCount: 2,
                    childAspectRatio: 2.2, // ( width/height)
                    children: [
                      Container(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                              ConnectScreen.routeName,
                            );
                          },
                          icon: Icon(Icons.add),
                          label: Text('Connect'),
                          style: ElevatedButton.styleFrom(
                            primary: green,
                          ),
                        ),
                      ),
                      Container(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                              TaskScreen.routeName,
                            );
                          },
                          icon: Icon(Icons.alarm),
                          label: Text('Task'),
                          style: ElevatedButton.styleFrom(
                            primary: blue,
                          ),
                        ),
                      ),
                      Container(
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.book),
                          label: Text('History'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: orange,
                          ),
                        ),
                      ),
                      Container(
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.leaderboard),
                          label: Text('Analysis'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: purple,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
