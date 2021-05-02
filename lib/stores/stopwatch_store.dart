import 'dart:async';
import 'package:simple_hour/controllers/statistics_controller.dart';
import 'package:simple_hour/index.dart';

class StopwatchStore extends Store {
  static StopwatchStore get to => Get.put(StopwatchStore());

  int currentNavigationIndex = 1;

  final double taskListItemHeight = 55.0;
  double taskListHeight = 55;

  List<TaskModel> tasks = [];
  List<Map<String, dynamic>> get tasksJsonList =>
      tasks.map((e) => e.toJson()).toList();
  TaskModel? get firstTask => tasks.length > 0 ? tasks[0] : null;

  TaskModel? selectedTask;

  Timer? timer;

  List<StatitsticsModel> statistics = [];

  void onReady() {
    StopwatchController().onScreenReady();
    TaskController().setTaskListHeightByListLength();
    StatisticsController().loadStatistics();
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

  void removeTask(TaskModel task) {
    tasks.removeWhere((element) => element.id == task.id);
    update();
  }

  void incertTask(TaskModel task) {
    tasks.insert(0, task);
    update();
  }

  void setTasksByJsonList(List<Map<String, dynamic>> jsonList) {
    final list = jsonList.map<TaskModel>((e) => TaskModel.fromJson(e)).toList();
    tasks = list;
    update();
  }

  int getLastIndex() {
    int id = 0;
    tasks.forEach((element) {
      if (element.id > id) id = element.id;
    });
    return id;
  }

  void setSelectedTask(TaskModel? task) {
    selectedTask = task;
    update();
  }

  void setSelectedTaskState(TaskState state) {
    selectedTask?.state = state;
    update();
  }

  void setSelectedTaskDuration(Duration duration) {
    selectedTask?.duration = duration;
    update();
  }

  void decreaseSelectedTaskDurationForSecond() {
    int seconds = selectedTask!.duration.inSeconds;
    selectedTask?.duration = Duration(seconds: --seconds);
    update();
  }

  void addStatsToStatistics(StatitsticsModel model) {
    statistics.add(model);
    update();
  }

  void rewriteLastStatsInStatistics(StatitsticsModel model) {
    statistics.last = model;
    update();
  }
}
