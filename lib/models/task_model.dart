import 'package:simple_hour/index.dart';

class TaskModel {
  TaskModel({
    required this.id,
    this.name = '',
    this.currentDuration = const Duration(hours: 1),
    this.initialDuration = const Duration(hours: 1),
  });

  int id = 0;
  String name = '';
  DateTime? date;
  Duration initialDuration = const Duration(hours: 1);
  Duration currentDuration = const Duration(hours: 1);
  Duration totalDurationToday = const Duration();
  TaskState state = TaskState.play;

  bool get done => currentDuration.inSeconds == 0;
  bool get nameIsEmpty => name == '';
  bool get durationIsZero => currentDuration.inSeconds == 0;

  TaskModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    initialDuration = ConverterService.parseDuration(json['initialDuration']);
    currentDuration = ConverterService.parseDuration(json['currentDuration']);
    totalDurationToday =
        ConverterService.parseDuration(json['totalDurationToday']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'initialDuration': initialDuration.toString(),
      'currentDuration': currentDuration.toString(),
      'totalDurationToday': totalDurationToday.toString(),
    };
  }

  @override
  String toString() => jsonEncode(toJson());
}
