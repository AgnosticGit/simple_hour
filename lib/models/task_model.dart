import 'package:simple_hour/index.dart';

class TaskModel {
  TaskModel({
    required this.id,
    this.name = '',
    this.duration = const Duration(hours: 1),
    required this.days,
    this.done = false,
  });

  int id = 0;
  String name = '';
  Duration duration = const Duration(hours: 1);
  List<int> days = [];
  bool done = false;

  bool get nameIsEmpty => name == '';
  bool get daysIsEmpty => days.length == 0;
  bool get durationIsZero => duration.inSeconds == 0;

  TaskModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    duration = ConverterService.parseDuration(json['duration']);
    days = json['days'];
    done = json['done'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'duration': duration.toString(),
      'days': days,
      'done': false,
    };
  }
}
