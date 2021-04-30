import 'package:simple_hour/index.dart';


class TaskController {
  void setTaskListHeightByListLength() {
    int length = 3;
    final taskListItemHeight = StopwatchStore.to.taskListItemHeight;
    final taskListHeight = length * taskListItemHeight;
    StopwatchStore.to.setTaskListHeight(taskListHeight);
  }

  void onAddTask(){
    Get.to(UpsertTaskScreen());
  }
}
