import 'dart:async';
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

  void onSetLastTask() {
    final tasks = StopwatchStore.to.tasks;
    if (tasks.length == 0) {
      StopwatchStore.to.setSelectedTask(null);
    } else {
      StopwatchStore.to.setSelectedTask(tasks.last);
    }
  }

  void onSelectTask(TaskModel task) {
    StopwatchStore.to.setSelectedTask(task);
  }

  void onTapPlay() {
    StopwatchStore.to.setSelectedTaskState(TaskState.pause);
    StopwatchStore.to.timer?.cancel();
    _startTimer();
  }

  void onTapPause() {
    StopwatchStore.to.setSelectedTaskState(TaskState.play);
    StopwatchStore.to.timer?.cancel();
    _startTimer();
  }

  void onTapRefresh() {
    final selectedTask = StopwatchStore.to.selectedTask;
    StopwatchStore.to.setSelectedTaskState(TaskState.play);
    StopwatchStore.to.setSelectedTaskDuration(selectedTask!.initialDuration);
    _startTimer();
  }

  void _startTimer() {
    StopwatchStore.to.timer = Timer.periodic(Duration(seconds: 1), (timer) {
      final selectedTask = StopwatchStore.to.selectedTask;

      if (selectedTask!.state == TaskState.pause) {
        int seconds = selectedTask.duration.inSeconds;
        if (seconds > 0) {
          StopwatchStore.to.decreaseSelectedTaskDurationForSecond();
          StatisticsController().saveStatistics();
          _saveToHive();
        } else {
          StopwatchStore.to.timer?.cancel();
        }
      }
    });
  }

  void _saveToHive() {
    final tasksJsonList = StopwatchStore.to.tasksJsonList;
    HiveService.setTasks(tasksJsonList);
  }
}
