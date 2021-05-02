import 'package:simple_hour/index.dart';

class TaskModel {
  TaskModel({
    required this.id,
    this.name = '',
    this.duration = const Duration(hours: 1),
    this.initialDuration = const Duration(hours: 1),
    required this.days,
  });

  int id = 0;
  String name = '';
  Duration initialDuration = const Duration(hours: 1);
  Duration duration = const Duration(hours: 1);
  List<int> days = [];
  TaskState state = TaskState.play;

  bool get done => duration.inSeconds == 0;
  bool get nameIsEmpty => name == '';
  bool get daysIsEmpty => days.length == 0;
  bool get durationIsZero => duration.inSeconds == 0;

  TaskModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    initialDuration = ConverterService.parseDuration(json['initial_duration']);
    duration = ConverterService.parseDuration(json['duration']);
    days = json['days'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'initial_duration': initialDuration.toString(),
      'duration': duration.toString(),
      'days': days,
      'done': false,
    };
  }
}
