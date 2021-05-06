import 'package:simple_hour/index.dart';

class LoadController {
  void onApplicationReady() async {
    await HiveController().setTasksToStore();
    await onLastLoadInNewDay();
    TaskController().setFirstTaskToStore();
    StopwatchScreenController().setTaskListHeightByListLength();
    HiveController().setStatisticsToStore();
  }

  Future<void> onLastLoadInNewDay() async {
    if (!await HiveController().isLastDayToday()) {
      TaskController().refreshTasksTime();
      HiveController().setLastDateToHive();
      HiveController().setRawTasksToHive();
      HiveController().setTasksToStore();
    }
  }
}
