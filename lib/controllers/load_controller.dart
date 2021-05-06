import 'package:simple_hour/index.dart';

class LoadController {
  void onApplicationReady() async {
    await HiveController().setTasksToStore();
    TaskController().setFirstTaskToStore();
    StopwatchScreenController().setTaskListHeightByListLength();
    HiveController().setStatisticsToStore();
  }
}
