import 'package:flutter/cupertino.dart';
import 'package:simple_hour/index.dart';

class UpsertTaskScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.deeperBlue,
      appBar: AppBar(
        title: Text('Create Task'),
        backgroundColor: CustomColors.deeperBlue,
        elevation: 0,
      ),
      body: Container(
        child: Align(
          child: Container(
            width: 300.0,
            child: Column(
              children: [
                const SizedBox(height: 20.0),
                Input(
                  hintText: 'Name',
                ),
                const SizedBox(height: 20.0),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(color: Colors.white)
                  ),

                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(child: _buildWeekDays('Mon', 1)),
                          Expanded(child: _buildWeekDays('Tue', 2)),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(child: _buildWeekDays('Wed', 3)),
                          Expanded(child: _buildWeekDays('Thu', 4)),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(child: _buildWeekDays('Fri', 5)),
                          Expanded(child: _buildWeekDays('Sat', 6)),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(child: _buildWeekDays('Sun', 7)),
                          Expanded(child: const SizedBox())
                        ],
                      ),
                    ],
                  ),
                ),
                CupertinoTheme(
                  data: CupertinoThemeData(brightness: Brightness.dark),
                  child: CupertinoTimerPicker(
                    onTimerDurationChanged: (_) {},
                  ),
                ),
                ElevatedButton(onPressed: () {}, child: Text('Save'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWeekDays(String dayName, int dayNumber) {
    return CheckboxListTile(
      activeColor: Colors.green,
      title: Text(
        dayName,
        style: TextStyle(color: Colors.white),
      ),
      value: true,
      // value: UpsertTopicStore.to.scheduledTask.days.contains(dayNumber),
      onChanged: (_) {},
    );
  }
}
