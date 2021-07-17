import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../theme/theme.dart';

class NewTaskForm extends StatefulWidget {
  const NewTaskForm({Key? key}) : super(key: key);

  @override
  _NewTaskFormState createState() => _NewTaskFormState();
}

class _NewTaskFormState extends State<NewTaskForm> {
  String _selectedTag = 'medicine';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 24,
        horizontal: 16,
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(
              bottom: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Title',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(
                    // hintText: 'Take medicines',
                    // hintStyle: TextStyle(
                    //   fontSize: 14,
                    //   fontStyle: FontStyle.italic,
                    //   color: Colors.black54,
                    // ),
                    filled: true,
                    fillColor: Color.fromRGBO(189, 224, 254, 0.3),
                    contentPadding: EdgeInsets.all(12),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(189, 224, 254, 0.5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              bottom: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Description',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(
                    // hintText: 'After food tablets',
                    // hintStyle: TextStyle(
                    //   fontSize: 14,
                    //   fontStyle: FontStyle.italic,
                    //   color: Colors.black54,
                    // ),
                    filled: true,
                    fillColor: Color.fromRGBO(189, 224, 254, 0.3),
                    contentPadding: EdgeInsets.all(12),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(189, 224, 254, 0.5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          dateAndTime(context),
          dropdownSection(),
          AddTask(),
        ],
      ),
    );
  }

  Container dateAndTime(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Date and time',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width / 2,
                ),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(233, 236, 239, 0.3),
                  border: Border.all(
                    color: Color.fromRGBO(233, 236, 239, 0.5),
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DateFormat.yMMMd().format(DateTime.now()),
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      DateFormat.jm().format(DateTime.now()),
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.calendar_today),
                label: Text('Date'),
                style: TextButton.styleFrom(primary: Colors.black),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.access_time),
                label: Text('Time'),
                style: TextButton.styleFrom(
                  primary: Colors.black,
                  padding: EdgeInsets.only(right: 0),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Padding dropdownSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'What kind of task?',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                ),
              ),
              DropdownButton(
                value: _selectedTag,
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.blue,
                ),
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.blue,
                ),
                underline: Container(
                  height: 2,
                  color: Colors.blue,
                ),
                onChanged: (String? newTag) {
                  setState(() {
                    _selectedTag = newTag!;
                  });
                },
                items: ['medicine', 'exercise', 'diet', 'other'].map((value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Repeat',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                ),
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  primary: Colors.black,
                  padding: EdgeInsets.only(right: 0),
                ),
                child: Row(
                  children: [
                    Text(
                      'Once',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_right),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class AddTask extends StatelessWidget {
  const AddTask({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: () {},
        child: Text(
          'Add Task',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
            fontSize: 16,
          ),
        ),
        style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: blue,
          padding: EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
        ),
      ),
    );
  }
}
