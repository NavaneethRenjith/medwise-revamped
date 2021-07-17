import 'package:flutter/material.dart';

import '../../theme/theme.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/task/new_task_form.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({Key? key}) : super(key: key);

  @override
  _NewTaskScreenState createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'New Task',
        bgColor: blue,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: NewTaskForm(),
      ),
    );
  }
}
