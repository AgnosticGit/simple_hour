import 'package:simple_hour/index.dart';

class TaskModel {
  TaskModel({
    required this.id,
    this.name = '',
    this.duration = const Duration(hours: 1),
    this.initialDuration = const Duration(hours: 1),
  });

  int id = 0;
  String name = '';
  DateTime? date;
  Duration initialDuration = const Duration(hours: 1);
  Duration duration = const Duration(hours: 1);

  TaskState state = TaskState.play;

  bool get done => duration.inSeconds == 0;
  bool get nameIsEmpty => name == '';
  bool get durationIsZero => duration.inSeconds == 0;

  TaskModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    initialDuration = ConverterService.parseDuration(json['initial_duration']);
    duration = ConverterService.parseDuration(json['duration']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'initial_duration': initialDuration.toString(),
      'duration': duration.toString(),
      'done': false,
    };
  }

  @override
  String toString() => jsonEncode(toJson());
}
