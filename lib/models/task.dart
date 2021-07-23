class Task {
  String id;
  String title;
  String desc;
  String tag;
  DateTime dateTime;
  bool done;

  Task({
    required this.id,
    required this.title,
    required this.desc,
    required this.tag,
    required this.dateTime,
    this.done = false,
  });
}
