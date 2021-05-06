import 'dart:async';
import 'package:simple_hour/index.dart';

class StopwatchScreenController {
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
          StatisticsScreenController().saveStatistics();
          HiveController().setRawTasksToHive();
        } else {
          StopwatchStore.to.timer?.cancel();
        }
      }
    });
  }

  void setTaskListHeightByListLength() {
    int length = 3;
    final taskListItemHeight = StopwatchStore.to.taskListItemHeight;
    final taskListHeight = length * taskListItemHeight;
    StopwatchStore.to.setTaskListHeight(taskListHeight);
  }
}
