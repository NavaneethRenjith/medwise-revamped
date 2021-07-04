import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medwise/models/profile_model.dart';

class EditProfile extends StatefulWidget {
  final ProfileModel profileModel;
  EditProfile({
    required this.profileModel,
  });
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String newusername = '';
  String newphone = '';
  String newemail = '';
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();

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
          'EDIT',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
      ),
      backgroundColor: Colors.black,
      body: Container(
        height: MediaQuery.of(context).size.height * .85,
        padding: EdgeInsets.fromLTRB(20, 16, 20, 16),
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
                height: 40,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Username",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                initialValue: widget.profileModel.name,
                style: TextStyle(color: Colors.white),
                onChanged: (val) async {
                  setState(() {
                    newusername = val.toString();
                  });
                },
                decoration: InputDecoration(
                  isDense: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.white)),
                  hintText: "Username",
                  hintStyle: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Phone",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                initialValue: widget.profileModel.phone,
                style: TextStyle(color: Colors.white),
                onChanged: (val) async {
                  setState(() {
                    newphone = val.toString();
                  });
                },
                decoration: InputDecoration(
                  isDense: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.white)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.white)),
                  hintText: "Phone number",
                  hintStyle: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Email",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                initialValue: widget.profileModel.email,
                style: TextStyle(color: Colors.white),
                onChanged: (val) async {
                  setState(() {
                    newemail = val.toString();
                  });
                },
                decoration: InputDecoration(
                  isDense: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.white)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.white)),
                  hintText: "Email",
                  hintStyle: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                child: Text('Save'),
                onPressed: () async {
                  // if (_usernameController.text != widget.username) {
                  //   print(_usernameController);
                  // }
                  final _user = FirebaseAuth.instance.currentUser;

                  await FirebaseFirestore.instance
                      .collection('users')
                      .doc(_user!.uid)
                      .set({
                    "name": newusername != '' &&
                            newusername != widget.profileModel.name
                        ? newusername
                        : widget.profileModel.name,
                    "email":
                        newemail != '' && newemail != widget.profileModel.email
                            ? newemail
                            : widget.profileModel.email,
                    "phone_number":
                        newphone != '' && newphone != widget.profileModel.phone
                            ? newphone
                            : widget.profileModel.phone,
                  }).then((value) {
                    print("updated");
                  });

                  if (newusername != '' &&
                      newusername != widget.profileModel.name) {
                    // submit newusername
                    print(newusername);
                  }

                  if (newphone != '' && newphone != widget.profileModel.phone) {
                    // submit newusername
                    print(newphone);
                  }

                  if (newemail != '' && newemail != widget.profileModel.email) {
                    // submit newusername
                    print(newemail);
                  }
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
