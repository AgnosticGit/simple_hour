import 'package:simple_hour/index.dart';

class StopwatchStore extends Store {
  static StopwatchStore get to => Get.put(StopwatchStore());

  int currentNavigationIndex = 1;

  final double taskListItemHeight = 55.0;
  double taskListHeight = 55;
  List<TaskModel> tasks = [];

  void onReady() {
    TaskController().setTaskListHeightByListLength();
    super.onReady();
  }

  void setTaskListHeight(double height) {
    taskListHeight = height;
    update();
  }

  void setCurrentNavigationIndex(int index) {
    currentNavigationIndex = index;
    update();
  }

  void incertTask(TaskModel task) {
    tasks.insert(0, task);
    update();
  }
  
}
