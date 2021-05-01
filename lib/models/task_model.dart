class TaskModel {
  TaskModel({
    this.name = '',
    this.duration = const Duration(hours: 1),
    required this.days,
    this.done = false,
  });

  String name = '';
  Duration duration = const Duration(hours: 1);
  List<int> days = [];
  bool done = false;

  TaskModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    duration = json['duration'];
    days = json['days'];
    done = json['done'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'duration': duration,
      'days': days,
      'done': false
    };
  }
}
