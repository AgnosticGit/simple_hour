import 'package:simple_hour/index.dart';

class TaskController {
  void setTaskListHeightByListLength() {
    int length = 3;
    final taskListItemHeight = StopwatchStore.to.taskListItemHeight;
    final taskListHeight = length * taskListItemHeight;
    StopwatchStore.to.setTaskListHeight(taskListHeight);
  }

  void onAddTask() {
    Get.to(UpsertTaskScreen());
  }

  void onRemoveTask(TaskModel task) {
    StopwatchStore.to.removeTask(task);
    StopwatchStore.to.removeStatsByTask(task);
    HiveService.removeStatsByTask(task);
    HiveService.removeTask(task);
  }
}
