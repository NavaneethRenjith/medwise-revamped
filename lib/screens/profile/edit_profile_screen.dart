import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  final String username, phone, email;

  EditProfileScreen({
    required this.username,
    required this.phone,
    required this.email,
  });

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
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
      backgroundColor: Color(0xfff6f6f9),
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
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                initialValue: widget.username,
                onChanged: (val) async {
                  setState(() {
                    newusername = val.toString();
                  });
                },
                decoration: InputDecoration(
                  isDense: true,
                  enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide(width: 1)),
                  focusedBorder:
                      OutlineInputBorder(borderSide: BorderSide(width: 1)),
                  hintText: "Username",
                  hintStyle: TextStyle(fontSize: 20),
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
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                initialValue: widget.phone,
                onChanged: (val) async {
                  setState(() {
                    newphone = val.toString();
                  });
                },
                decoration: InputDecoration(
                  isDense: true,
                  enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide(width: 1)),
                  focusedBorder:
                      OutlineInputBorder(borderSide: BorderSide(width: 1)),
                  hintText: "Phone number",
                  hintStyle: TextStyle(fontSize: 20),
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
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                initialValue: widget.email,
                onChanged: (val) async {
                  setState(() {
                    newemail = val.toString();
                  });
                },
                decoration: InputDecoration(
                  isDense: true,
                  enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide(width: 1)),
                  focusedBorder:
                      OutlineInputBorder(borderSide: BorderSide(width: 1)),
                  hintText: "Email",
                  hintStyle: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                child: Text('Save'),
                onPressed: () {
                  // if (_usernameController.text != widget.username) {
                  //   print(_usernameController);
                  // }

                  if (newusername != '' && newusername != widget.username) {
                    // submit newusername
                    print(newusername);
                  }

                  if (newphone != '' && newphone != widget.phone) {
                    // submit newusername
                    print(newphone);
                  }

                  if (newemail != '' && newemail != widget.email) {
                    // submit newusername
                    print(newemail);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
