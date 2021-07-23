import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../theme/theme.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/task/new_task_form.dart';

class NewTaskScreen extends StatelessWidget {
  const NewTaskScreen({Key? key}) : super(key: key);

  void _submitTask(
    String title,
    String desc,
    String tag,
    DateTime date,
    TimeOfDay time,
  ) {
    print(title);
    print(desc);
    print(tag);
    final dateTime =
        DateTime(date.year, date.month, date.day, time.hour, time.minute);
    print(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'New Task',
        bgColor: blue,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: NewTaskForm(_submitTask),
      ),
    );
  }
}
