class TaskModel {
  TaskModel({
    this.name = '',
    this.time = const Duration(hours: 1),
    required this.days,
  });

  String name = '';
  Duration time = const Duration(hours: 1);
  List<int> days = [];

  TaskModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    time = json['time'];
    days = json['days'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'time': time,
      'days': days,
    };
  }
}
