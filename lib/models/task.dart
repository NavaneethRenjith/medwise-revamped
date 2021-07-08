class Task {
  String title;
  String desc;
  String tag;
  DateTime dateTime;
  bool done;

  Task({
    required this.title,
    required this.desc,
    required this.tag,
    required this.dateTime,
    this.done = false,
  });
}
