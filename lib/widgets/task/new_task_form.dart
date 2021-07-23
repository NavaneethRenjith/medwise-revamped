import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../theme/theme.dart';

class NewTaskForm extends StatefulWidget {
  final void Function(
    String title,
    String desc,
    String tag,
    DateTime date,
    TimeOfDay time,
  ) submitTask;

  NewTaskForm(this.submitTask);

  @override
  _NewTaskFormState createState() => _NewTaskFormState();
}

class _NewTaskFormState extends State<NewTaskForm> {
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  String _selectedTag = 'medicine';
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2022),
    ).then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  void _presentTimePicker() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((pickedTime) {
      if (pickedTime == null) return;
      setState(() {
        _selectedTime = pickedTime;
      });
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 24,
        horizontal: 16,
      ),
      child: Column(
        children: [
          TitleAndDesc(
            titleController: _titleController,
            descController: _descController,
          ),
          dateAndTime(context),
          tagAndRepeatSection(),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                if (_selectedDate == null || _selectedTime == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please select date and time'),
                      backgroundColor: Theme.of(context).errorColor,
                    ),
                  );
                  return;
                }
                widget.submitTask(
                  _titleController.text,
                  _descController.text,
                  _selectedTag,
                  _selectedDate!,
                  _selectedTime!,
                );
                FocusScope.of(context).unfocus();
              },
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
          ),
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
                      _selectedDate == null
                          ? 'Date'
                          : DateFormat.yMMMd().format(_selectedDate!),
                    ),
                    Text(
                      _selectedTime == null
                          ? 'Time'
                          : MaterialLocalizations.of(context)
                              .formatTimeOfDay(_selectedTime!),
                    ),
                  ],
                ),
              ),
              TextButton.icon(
                onPressed: _presentDatePicker,
                icon: Icon(Icons.calendar_today),
                label: Text('Date'),
                style: TextButton.styleFrom(primary: Colors.black),
              ),
              TextButton.icon(
                onPressed: _presentTimePicker,
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

  Padding tagAndRepeatSection() {
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

class TitleAndDesc extends StatelessWidget {
  const TitleAndDesc({
    Key? key,
    required TextEditingController titleController, //! Fix this
    required TextEditingController descController,
  })  : _titleController = titleController,
        _descController = descController,
        super(key: key);

  final TextEditingController _titleController;
  final TextEditingController _descController;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          SizedBox(height: 5),
          TextField(
            controller: _titleController,
            style: TextStyle(fontFamily: 'Roboto'),
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
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
          SizedBox(height: 20),
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
            controller: _descController,
            style: TextStyle(fontFamily: 'Roboto'),
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
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
    );
  }
}
