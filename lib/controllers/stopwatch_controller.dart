import 'package:simple_hour/index.dart';

class StopwatchController {
  void onScreenReady() async {
    await _loadTasks();
    _loadSelectedTask();
  }

  Future<void> _loadTasks() async {
    final tasks = await HiveService.getTasks();
    StopwatchStore.to.setTasksByJsonList(tasks);
  }

  void _loadSelectedTask() {
    final firstTask = StopwatchStore.to.firstTask;
    StopwatchStore.to.setSelectedTask(firstTask);
  }

  void onSelectTask(TaskModel task) {}
}
