import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

import './new_task_screen.dart';

import '../../theme/theme.dart';
// import '../../widgets/task/date.dart';
import '../../widgets/task/task_list_item.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  static const routeName = '/task-screen';

  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final _user = FirebaseAuth.instance.currentUser;

  void _changeUserTaskDone(bool done, String docId) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(_user!.uid)
        .collection('tasks')
        .doc(docId)
        .update({
      'done': done,
    });
  }

  void _deleteTask(String docId) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(_user!.uid)
        .collection('tasks')
        .doc(docId)
        .delete();
  }

  var _taskScreenDate = DateTime.now();
  // Time 00:00 of current day
  var _dayBegin = DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day, 0);
  // Time 00:00 of next day
  var _dayEnd = DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day + 1, 0);

  void _changeTaskScreenDate(DateTime newDate) {
    setState(() {
      _taskScreenDate = newDate;

      _dayBegin = DateTime(
        newDate.year,
        newDate.month,
        newDate.day,
        0,
      );
      _dayEnd = DateTime(
        newDate.year,
        newDate.month,
        newDate.day,
        24,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(_user!.uid)
            .collection('tasks')
            .where(
              'dateTime',
              isGreaterThanOrEqualTo: _dayBegin,
              isLessThan: _dayEnd,
            )
            .orderBy('dateTime')
            .snapshots(),
        builder: (ctx, taskSnapshot) {
          if (taskSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final taskDocs = taskSnapshot.data!.docs;

          return CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                pinned: false,
                snap: false,
                backgroundColor: blue,
                expandedHeight: MediaQuery.of(context).size.height / 4,
                flexibleSpace: FlexibleSpaceBar(
                  background: Date(
                    taskScreenDate: _taskScreenDate,
                    changeTaskScreenDate: _changeTaskScreenDate,
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext ctx, int i) {
                    DateTime dateTime = taskDocs[i]['dateTime'].toDate();
                    return TaskListItem(
                      id: taskDocs[i].id,
                      title: taskDocs[i]['title'],
                      desc: taskDocs[i]['desc'],
                      time: DateFormat.jm().format(dateTime).toString(),
                      taskDone: taskDocs[i]['done'],
                      changeUserTaskDone: _changeUserTaskDone,
                      deleteTask: _deleteTask,
                    );
                  },
                  childCount: taskDocs.length,
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => NewTaskScreen(),
            ),
          );
        },
        backgroundColor: blue,
        child: Icon(Icons.add),
      ),
    );
  }
}

class Date extends StatelessWidget {
  final DateTime taskScreenDate;
  final void Function(DateTime newDate) changeTaskScreenDate;

  Date({
    Key? key,
    required this.taskScreenDate,
    required this.changeTaskScreenDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    void _presentDatePicker() {
      showDatePicker(
        context: context,
        initialDate: taskScreenDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2022),
      ).then((pickedDate) {
        if (pickedDate == null) return;
        changeTaskScreenDate(pickedDate);
      });
    }

    return Center(
      child: Container(
        padding: EdgeInsets.only(top: statusBarHeight),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: GestureDetector(
                onTap: _presentDatePicker,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      DateFormat('d').format(taskScreenDate),
                      style: TextStyle(
                        fontSize: 80,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            DateFormat('MMM').format(DateTime.now()),
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            DateFormat('E').format(DateTime.now()),
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_upward,
                    color: Colors.white38,
                  ),
                  Text(
                    'tap on date to change it',
                    style: TextStyle(
                      color: Colors.white38,
                    ),
                  ),
                  SizedBox(width: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
