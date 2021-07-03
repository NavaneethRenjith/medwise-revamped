import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AuthForm extends StatefulWidget {
  final bool isLoading;

  final void Function(
    String name,
    String email,
    String phone,
    String dob,
    String password,
    bool isLogin,
  ) submitFn;

  AuthForm(this.submitFn, this.isLoading);

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>(); //To validate the form
  var _isLogin = true; // Show login page

  String _userEmail = '';
  String _userName = '';
  String _userPassword = '';
  String _userPhonenumber = '';
  late String _userDob;

  void _trySubmit() {
    if (_isLogin) {
      _userDob = "";
    }
    // Trigger all the validators of all TextFormFields in the form
    final isValid = _formKey.currentState!.validate();

    // To close any soft keyboard that might still be open
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState!.save();

      if (_selectedDate == null && !_isLogin) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please select your DOB'),
            backgroundColor: Theme.of(context).errorColor,
          ),
        );
      }

      // function call
      widget.submitFn(
        _userName.trim(),
        _userEmail.trim(),
        _userPhonenumber.trim(),
        _userDob.trim(),
        _userPassword.trim(),
        _isLogin,
      );
    }
  }

  var myFormat = DateFormat('d-MM-yyyy');
  DateTime? _selectedDate;
  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1921),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        _selectedDate = pickedDate;
        _userDob = myFormat.format(_selectedDate!).toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(24),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
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
                if (!_isLogin)
                  Container(
                    margin: EdgeInsets.only(
                      top: 10,
                    ),
                    alignment: Alignment.centerLeft,
                    child: TextButton.icon(
                      onPressed: _presentDatePicker,
                      icon: Icon(Icons.calendar_today),
                      label: Text(
                        _selectedDate != null
                            ? myFormat.format(_selectedDate!).toString()
                            : "Select your DOB",
                      ),
                    ),
                  ),
                TextFormField(
                  key: ValueKey('password'),
                  validator: (value) {
                    if (value!.isEmpty || value.length < 8) {
                      return 'Password must be at least 8 characters long.';
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
                  ElevatedButton(
                    child: Text(_isLogin ? 'Login' : 'Signup'),
                    onPressed: _trySubmit,
                  ),
                if (!widget.isLoading)
                  TextButton(
                    child: Text(_isLogin
                        ? 'Create new account'
                        : 'I already have an account'),
                    onPressed: () {
                      setState(() {
                        _isLogin = !_isLogin;
                      });
                    },
                    style: TextButton.styleFrom(
                      primary: Colors.black87,
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
