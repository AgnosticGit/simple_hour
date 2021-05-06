import 'package:simple_hour/index.dart';

class HiveController {
  Future<void> setTasksToStore() async {
    final tasks = await HiveService.getTasks();
    StopwatchStore.to.setTasksByJsonList(tasks);
  }

  void setRawTasksToHive() {
    final tasksJsonList = StopwatchStore.to.tasksJsonList;
    HiveService.setTasks(tasksJsonList);
  }
}
