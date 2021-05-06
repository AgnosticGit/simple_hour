import 'package:simple_hour/index.dart';

class StatisticsScreenController {
  void saveStatistics() {
    StatisticsController().setStatisticstToStore();
    HiveController().setStatisticsToHive();
  }

  void onChangeFilter(ChartsYAxisFormat? format) {
    StopwatchStore.to.setFormat(format!);
  }
}
