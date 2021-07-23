import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
    final dateTime =
        DateTime(date.year, date.month, date.day, time.hour, time.minute);

    final user = FirebaseAuth.instance.currentUser;

    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .collection('tasks')
        .add({
      'title': title,
      'desc': desc,
      'dateTime': dateTime,
      'tag': tag,
      'done': false,
    });
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
