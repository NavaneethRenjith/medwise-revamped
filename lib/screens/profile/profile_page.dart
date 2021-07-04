import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medwise/models/profile_model.dart';
import 'package:medwise/screens/profile/help_page.dart';
import 'package:medwise/screens/profile/settings_page.dart';

import 'edit_profile.dart';

class ProfilePage extends StatefulWidget {
  final String uid;
  ProfilePage({required this.uid});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String username = '';
  String email = '';
  String phone = '';
  late ProfileModel profileModel;
  getUserInfo() async {
    FirebaseFirestore.instance
        .collection('users')
        .doc(widget.uid)
        .get()
        .then((value) {
      setState(() {
        username = value["name"];
        email = value["email"];
        phone = value["phone_number"];
        profileModel = new ProfileModel(
            name: value["name"],
            email: value["email"],
            phone: value["phone_number"]);
      });
    });
  }

  @override
  void initState() {
    getUserInfo();
    // TODO: implement initState
    super.initState();
  }

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
      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      //   backgroundColor: Colors.black,
      //   title: Text(
      //     'PROFILE',
      //     textAlign: TextAlign.center,
      //     style: TextStyle(color: Colors.white),
      //   ),
      //   elevation: 0,
      //   actions: [
      //     IconButton(
      //       icon: Icon(Icons.edit),
      //       onPressed: () {
      //         Navigator.of(context).push(MaterialPageRoute(
      //             builder: (context) => EditProfile(
      //                   username: username,
      //                   email: email,
      //                   phone: phone,
      //                 )));
      //       },
      //     )
      //   ],
      // ),
      // backgroundColor: Color(0xfff6f6f9),
      // body: username == ''
      //     ? Center(child: CircularProgressIndicator())
      //     : Container(
      //         height: MediaQuery.of(context).size.height * .85,
      //         padding: EdgeInsets.all(16),
      //         child: SingleChildScrollView(
      //           child: Column(
      //             children: [
      //               Container(
      //                 child: Icon(
      //                   Icons.account_circle,
      //                   size: 100,
      //                   color: Color.fromRGBO(67, 67, 67, 1),
      //                 ),
      //               ),
      //               SizedBox(
      //                 height: 20.0,
      //               ),
      //               Card(
      //                 margin: EdgeInsets.symmetric(
      //                     vertical: 10.0, horizontal: 25.0),
      //                 color: Colors.white,
      //                 child: ListTile(
      //                   leading: Text(
      //                     'Name',
      //                     style: TextStyle(
      //                       fontSize: 20.0,
      //                     ),
      //                   ),
      //                   title: Text(
      //                     username,
      //                     style: TextStyle(
      //                       color: Colors.black,
      //                       fontSize: 20.0,
      //                       fontWeight: FontWeight.w500,
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //               SizedBox(
      //                 height: 20.0,
      //               ),
      //               Card(
      //                 margin: EdgeInsets.symmetric(
      //                     vertical: 10.0, horizontal: 25.0),
      //                 color: Colors.white,
      //                 child: ListTile(
      //                   leading: Icon(Icons.phone, color: Colors.black),
      //                   title: Text(
      //                     phone,
      //                     style: TextStyle(
      //                       color: Colors.black87,
      //                       fontSize: 20.0,
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //               SizedBox(
      //                 height: 20.0,
      //               ),
      //               Card(
      //                 margin: EdgeInsets.symmetric(
      //                     vertical: 10.0, horizontal: 25.0),
      //                 child: ListTile(
      //                   leading: Icon(Icons.email, color: Colors.black87),
      //                   title: Text(
      //                     email,
      //                     style: TextStyle(
      //                       color: Colors.black,
      //                       fontSize: 20.0,
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //               SizedBox(
      //                 height: 30,
      //               ),
      //               RaisedButton(
      //                 onPressed: () {
      //                   FirebaseAuth.instance.signOut().whenComplete(() {
      //                     Navigator.pop(context);
      //                   });
      //                 },
      //                 child: Text(
      //                   'Logout',
      //                   style: TextStyle(color: Colors.white, fontSize: 18),
      //                 ),
      //                 color: Colors.blue,
      //                 shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.circular(5),
      //                 ),
      //               ),
      //               SizedBox(
      //                 height: 30,
      //               ),
      //               Container(
      //                 child: Row(
      //                   children: [
      //                     Expanded(
      //                       child: Container(
      //                         // padding: EdgeInsets.only(top: 50),
      //                         child: FlatButton(
      //                           color: Color.fromRGBO(67, 67, 67, 1),
      //                           height: 50,
      //                           child: Text(
      //                             'Support',
      //                             style: TextStyle(color: Colors.white),
      //                           ),
      //                           onPressed: () {},
      //                         ),
      //                       ),
      //                     ),
      //                     SizedBox(
      //                       width: 20,
      //                     ),
      //                     Expanded(
      //                       child: Container(
      //                         child: FlatButton(
      //                           color: Color.fromRGBO(67, 67, 67, 1),
      //                           height: 50,
      //                           child: Text(
      //                             'Feedback',
      //                             style: TextStyle(
      //                                 color: Colors.white, fontSize: 16),
      //                           ),
      //                           onPressed: () {},
      //                         ),
      //                       ),
      //                     )
      //                   ],
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
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
        backgroundColor: Colors.transparent,
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
      body: username == ''
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.fromLTRB(30, 20, 25, 20),
                child: Column(
                  children: [
                    Row(
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
                                    fontSize: 20),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "+91 $phone",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                email,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20,
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
                                  // backgroundImage: AssetImage(
                                  //   "assets/images/profile_photo.jpeg")))
                                )))
                      ],
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Set up payment methods",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Icon(
                                    Icons.arrow_right_alt_outlined,
                                    color: Colors.white,
                                    size: 28,
                                  )
                                ]),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Icon(
                                      Icons.food_bank,
                                      color: Colors.white,
                                      size: 28,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "bank account",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "2 accounts",
                                      style: TextStyle(
                                        color: Colors.white54,
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Icon(
                                      Icons.credit_card,
                                      color: Colors.white,
                                      size: 28,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Pay businesses",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Debit/credit card",
                                      style: TextStyle(
                                        color: Colors.white54,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.card_giftcard,
                              color: Colors.white,
                              size: 28,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Invite friends, get.....",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Share your code j6je72",
                                  style: TextStyle(
                                    color: Colors.white54,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Share",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () async {
                        await Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => SettingsPage(
                                    profileModel: profileModel,
                                  )),
                        );
                        setState(() {
                          getUserInfo();
                        });
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.settings,
                            color: Colors.white,
                            size: 28,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Settings",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => HelpPage()),
                        );
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.help,
                            color: Colors.white,
                            size: 28,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Help & feedback",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
