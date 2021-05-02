import 'package:simple_hour/index.dart';

class StatisticsScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 300,
          child: StatsCharts(),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 200,
            child: TaskManager(
              tasks: StopwatchStore.to.tasks,
            ),
          ),
        ),
      ],
    );
  }
}
