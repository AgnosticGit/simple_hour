import 'package:simple_hour/index.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StatsCharts extends StatelessWidget {
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(),
      primaryYAxis: NumericAxis(labelFormat: "{value}h"),
      series: _createSampleData(),
    );
  }

  static List<ColumnSeries> _createSampleData() {
    final data = StopwatchStore.to.statistics;
    final List<TaskModel> newModels = [];

    data.forEach((stats) {
      stats.tasks.forEach((task) {
        task.date = stats.date;
        newModels.add(task);
      });
    });

    return newModels.map((task) {
      return ColumnSeries<TaskModel, String>(
        dataSource: newModels,
        xValueMapper: (m, _) => task.date.toString().split(' ').first,
        yValueMapper: (m, _) => Duration(
          seconds:
              (task.duration.inSeconds - task.initialDuration.inSeconds).abs(),
        ).inSeconds,
        dataLabelMapper: (m, _) => task.name,
        dataLabelSettings: DataLabelSettings(
          isVisible: true,
          color: Colors.white,
          labelAlignment: ChartDataLabelAlignment.top,
        ),
      );
    }).toList();
  }
}
