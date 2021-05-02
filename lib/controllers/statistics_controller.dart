import 'package:simple_hour/index.dart';

class StatisticsController {
  void loadStatistics() async{
    print(await HiveService.getStatistics());
  }

  void saveStatistics() {
    _saveStatisticstToStore();
    _saveStatisticsToHive();
  }

  void _saveStatisticstToStore() {
    final tasks = StopwatchStore.to.tasks;
    final stats = StatitsticsModel(tasks: tasks);
    final statistics = StopwatchStore.to.statistics;
    final date = ConverterService.getDateFromDateTime(stats.date);

    if (statistics.length == 0) {
      StopwatchStore.to.addStatsToStatistics(stats);
    } else {
      final statsLastDate =
          ConverterService.getDateFromDateTime(statistics.last.date);
      if (date == statsLastDate) {
        StopwatchStore.to.rewriteLastStatsInStatistics(stats);
      } else {
        StopwatchStore.to.addStatsToStatistics(stats);
      }
    }
  }

  void _saveStatisticsToHive() {
    final statistics = StopwatchStore.to.statistics;
    final stats = statistics.map((el) => el.toJson()).toList();
    HiveService.setStatistics(stats);
  }
}
