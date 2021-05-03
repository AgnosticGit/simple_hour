import 'package:simple_hour/index.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StatsCharts extends StatelessWidget {
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(),
      primaryYAxis: NumericAxis(labelFormat: "{value}min"),
      series: _createSampleData(),
    );
  }

  List<ColumnSeries> _createSampleData() {
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
        yValueMapper: (m, _) => 
            (task.duration.inSeconds - task.initialDuration.inSeconds).abs() /
            60,
        dataLabelMapper: (m, _) => task.name,
        dataLabelSettings: DataLabelSettings(
          isVisible: true,
          color: Colors.white,
          labelAlignment: ChartDataLabelAlignment.top,
        ),
      );
    }).toList();
  }

  num getFormatFromSeconds(num seconds, ChartsYAxisFormat format) {
    if (format == ChartsYAxisFormat.minute) {
      return double.parse((seconds / 60).toStringAsFixed(1));
    }
    if (format == ChartsYAxisFormat.hour) {
      return double.parse((seconds / 3600).toStringAsFixed(1));
    }
    return seconds;
  }
}
