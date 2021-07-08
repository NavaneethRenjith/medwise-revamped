import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

import '../../theme/theme.dart';
import '../../widgets/task/date.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(_user!.uid)
            .collection('tasks')
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
                  background: Date(),
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
                    );
                  },
                  childCount: taskDocs.length,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
