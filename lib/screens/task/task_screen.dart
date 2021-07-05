import 'package:flutter/material.dart';

import '../../theme/theme.dart';
import '../../widgets/task/date.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  static const routeName = '/task-screen';

  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: CustomScrollView(
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
                //! return our card here
                return Container(
                  color: i.isOdd ? Colors.white : Colors.black12,
                  height: 100.0,
                  child: Center(
                    child: Text('$i', textScaleFactor: 5),
                  ),
                );
              },
              childCount: 20,
            ),
          )
        ],
      ),
    );
  }
}
