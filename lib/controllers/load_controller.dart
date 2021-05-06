import 'package:simple_hour/controllers/hive_controller.dart';
import 'package:simple_hour/index.dart';

class LoadController {
  void onApplicationReady() async {
    await HiveController().setTasksToStore();
    TaskController().setFirstTaskToStore();
    StopwatchController().setTaskListHeightByListLength();
    StatisticsController().setStatisticsToStore();
  }
}
