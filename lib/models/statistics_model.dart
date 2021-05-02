import 'package:simple_hour/index.dart';

class StatitsticsModel {
  StatitsticsModel({required this.tasks});

  DateTime date = DateTime.now();
  List<TaskModel> tasks;

  Map<String, dynamic> toJson() {
    return {
      "date": date.toString(),
      "tasks": ConverterService.getTasksJsonList(tasks),
    };
  }
}
