import 'package:simple_hour/index.dart';

class TaskController {
  void onAddTask() {
    Get.to(UpsertTaskScreen());
  }

  void onRemoveTask(TaskModel task) {
    StopwatchStore.to.removeTask(task);
    StopwatchStore.to.removeStatsByTask(task);
    HiveService.removeStatsByTask(task);
    HiveService.removeTask(task);
  }

  void setFirstTaskToStore() {
    final firstTask = StopwatchStore.to.firstTask;
    StopwatchStore.to.setSelectedTask(firstTask);
  }

  void setLastTaskToStore() {
    final tasks = StopwatchStore.to.tasks;
    final selectedTask = StopwatchStore.to.selectedTask;

    if (tasks.where((e) => e.id == selectedTask?.id).length == 0) {
      if (tasks.length > 0) {
        StopwatchStore.to.setSelectedTask(tasks.last);
      } else {
        StopwatchStore.to.setSelectedTask(null);
      }
    }
  }

  void setNewTaskToStore() {
    final task = UpsertTaskStore.to.task;
    StopwatchStore.to.incertTask(task);
  }

  void refreshTasksTime() {
    final tasks = StopwatchStore.to.tasks;
    tasks.forEach((element) {
      element.currentDuration = element.initialDuration;
      element.totalDurationToday = const Duration();
    });
  }
}
