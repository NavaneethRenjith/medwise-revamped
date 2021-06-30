import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  final bool isLoading;
  AuthForm(this.submitFn, this.isLoading);
  final void Function(String name, String email, String phone, String dob,
      String password, bool isLogin, BuildContext context) submitFn;
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  var _userEmail = '';
  var _userName = '';
  var _userPassword = '';
  var _userPhonenumber = '';
  var _userDob = '';

  void _trySubmit() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState!.save();
      widget.submitFn(
          _userName.trim(),
          _userEmail.trim(),
          _userPhonenumber.trim(),
          _userDob.trim(),
          _userPassword.trim(),
          _isLogin,
          context);
      // Use those values to send our auth request ...

    }
  }

  var myFormat = DateFormat('d-MM-yyyy');
  DateTime _selectedDate = DateTime.now();
  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime(2022),
    ).then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        _selectedDate = pickedDate;
        _userDob = myFormat.format(_selectedDate).toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  if (!_isLogin)
                    TextFormField(
                      key: ValueKey('name'),
                      validator: (value) {
                        if (value!.isEmpty || value.length < 5) {
                          return 'Please enter at least 4 characters';
                        }
                        return null;
                      },
                      decoration: InputDecoration(labelText: 'Your name'),
                      onSaved: (value) {
                        _userName = value!;
                      },
                    ),
                  TextFormField(
                    key: ValueKey('email'),
                    validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return 'Please enter a valid email address.';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email address',
                    ),
                    onSaved: (value) {
                      _userEmail = value!;
                    },
                  ),
                  if (!_isLogin)
                    TextFormField(
                      key: ValueKey('userphonenumber'),
                      validator: (value) {
                        if (value!.isEmpty || value.length != 10) {
                          return 'Invalid Phone number';
                        }
                        return null;
                      },
                      decoration: InputDecoration(labelText: 'Phone number'),
                      onSaved: (value) {
                        _userPhonenumber = value!;
                      },
                    ),
                  SizedBox(
                    height: 15,
                  ),
                  if (!_isLogin)
                    GestureDetector(
                      onTap: () {
                        _presentDatePicker();
                        //  if (_userDob.isEmpty) return 'Select DOB';
                      },
                      child: Container(
                          child: Row(
                        children: [
                          IconButton(
                              icon: Icon(Icons.calendar_today),
                              onPressed: () {
                                _presentDatePicker();
                                print(_selectedDate);
                              }),
                          Text(
                            _selectedDate != null
                                ? myFormat.format(_selectedDate).toString()
                                : "Select your DOB",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      )),
                    ),
                  if (!_isLogin)
                    Divider(
                      thickness: 2.0,
                    ),
                  TextFormField(
                    key: ValueKey('password'),
                    validator: (value) {
                      if (value!.isEmpty || value.length < 7) {
                        return 'Password must be at least 7 characters long.';
                      }
                      return null;
                    },
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    onSaved: (value) {
                      _userPassword = value!;
                    },
                  ),
                  SizedBox(height: 12),
                  if (widget.isLoading) CircularProgressIndicator(),
                  if (!widget.isLoading)
                    RaisedButton(
                      child: Text(_isLogin ? 'Login' : 'Signup'),
                      onPressed: _trySubmit,
                    ),
                  if (!widget.isLoading)
                    FlatButton(
                      textColor: Theme.of(context).primaryColor,
                      child: Text(_isLogin
                          ? 'Create new account'
                          : 'I already have an account'),
                      onPressed: () {
                        setState(() {
                          _isLogin = !_isLogin;
                        });
                      },
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
