import 'package:simple_hour/index.dart';

class StatitsticsModel {
  StatitsticsModel({required this.tasks});

  DateTime date = DateTime.now();
  List<TaskModel> tasks = [];

  StatitsticsModel.fromJson(Map<String, dynamic> json) {
    date = DateTime.parse(json['date']);
    tasks = json['tasks']
        .map<TaskModel>(
          (task) => TaskModel.fromJson(
            Map<String, dynamic>.from(task),
          ),
        )
        .toList();
  }

  Map<String, dynamic> toJson() {
    return {
      "date": date.toString(),
      "tasks": ConverterService.getTasksJsonList(tasks),
    };
  }
}
