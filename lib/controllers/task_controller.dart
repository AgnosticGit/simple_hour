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
    if (tasks.length == 0) {
      StopwatchStore.to.setSelectedTask(null);
    } else if (tasks.length == 1) {
      StopwatchStore.to.setSelectedTask(tasks.last);
    }
  }

  void setNewTaskToStore() {
    final task = UpsertTaskStore.to.task;
    StopwatchStore.to.incertTask(task);
  }
}
