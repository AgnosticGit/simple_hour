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

  void setStatisticsToHive() {
    final statistics = StopwatchStore.to.statistics;
    final stats = statistics.map((el) => el.toJson()).toList();
    HiveService.setStatistics(stats);
  }

  void setStatisticsToStore() async {
    final rawStats = await HiveService.getStatistics();
    final stats = rawStats.map((el) => StatitsticsModel.fromJson(el)).toList();
    StopwatchStore.to.setStatistics(stats);
  }
}
