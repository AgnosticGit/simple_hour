import 'package:simple_hour/index.dart';

class StopwatchController {
  void loadTasks()async {
    final tasks = await HiveService.getTasks();
    StopwatchStore.to.setTasksByJsonList(tasks);
  }
}
