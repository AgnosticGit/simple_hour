import 'package:flutter/cupertino.dart';
import 'package:simple_hour/index.dart';

class StatisticsScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(height: 50.0),
        Expanded(
          flex: 3,
          child: Column(
            children: [
              Container(
                width: Get.width,
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: CupertinoSlidingSegmentedControl<ChartsYAxisFormat>(
                  groupValue: StopwatchStore.to.format,
                  children: {
                    ChartsYAxisFormat.hour: Text(
                      'Hour',
                      style: TextStyle(
                        color: _buildTextColor('Hour'),
                      ),
                    ),
                    ChartsYAxisFormat.minute: Text(
                      'Minute',
                      style: TextStyle(
                        color: _buildTextColor('Minute'),
                      ),
                    ),
                    ChartsYAxisFormat.second: Text(
                      'Second',
                      style: TextStyle(
                        color: _buildTextColor('Second'),
                      ),
                    )
                  },
                  onValueChanged: StatisticsController().onChangeFilter,
                ),
              ),
              const SizedBox(height: 20.0),
              Expanded(child: StatsCharts()),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: Get.width * 0.1,
            vertical: 10.0,
          ),
          color: Colors.white,
          height: 2.0,
        ),
        Expanded(
          flex: 2,
          child: TaskManager(
            tasks: StopwatchStore.to.tasks,
          ),
        ),
      ],
    );
  }

  Color _buildTextColor(String str) {
    final format = StopwatchStore.to.format;
    if (format == ChartsYAxisFormat.hour && str == 'Hour' ||
        format == ChartsYAxisFormat.minute && str == 'Minute' ||
        format == ChartsYAxisFormat.second && str == 'Second') {
      return Colors.black;
    }
    return Colors.white;
  }
}
