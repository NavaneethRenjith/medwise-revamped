import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class TaskListItem extends StatefulWidget {
  final String id;
  final String title;
  final String desc;
  final String time;
  bool taskDone;

  final void Function(
    bool done, // current task done status
    String docId,
  ) changeUserTaskDone;

  TaskListItem({
    Key? key,
    required this.id,
    required this.title,
    required this.desc,
    required this.time,
    required this.taskDone,
    required this.changeUserTaskDone,
  }) : super(key: key);

  @override
  _TaskListItemState createState() => _TaskListItemState();
}

class _TaskListItemState extends State<TaskListItem> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(widget.id),
      background: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 10),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {},
      child: Opacity(
        opacity: !widget.taskDone ? 1 : 0.4,
        child: Card(
          margin: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto',
                            color: blue,
                          ),
                        ),
                        Text(
                          widget.desc,
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(67, 67, 67, 0.8),
                          ),
                        ),
                        Text(
                          widget.time,
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(67, 67, 67, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      widget.taskDone = !widget.taskDone;
                      widget.changeUserTaskDone(widget.taskDone, widget.id);
                    });
                  },
                  icon: !widget.taskDone
                      ? Icon(
                          Icons.lens_outlined,
                        )
                      : Icon(
                          Icons.check_circle,
                        ),
                  color: blue,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
