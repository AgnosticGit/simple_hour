import 'package:flutter/cupertino.dart';
import 'package:simple_hour/index.dart';

class UpsertForm extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20.0),
        Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                spreadRadius: 4,
                blurRadius: 4,
              ),
            ],
          ),
          child: Input(
            hintText: 'Enter Task Name',
            onChanged: UpsertFormController().onInputTaskName,
          ),
        ),
        const SizedBox(height: 30.0),
        Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                spreadRadius: 4,
                blurRadius: 4,
              ),
            ],
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
        const SizedBox(height: 30.0),
        Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                spreadRadius: 4,
                blurRadius: 4,
              ),
            ],
          ),
          child: CupertinoTheme(
            data: CupertinoThemeData(brightness: Brightness.dark),
            child: CupertinoTimerPicker(
              onTimerDurationChanged:
                  UpsertFormController().onChangeTimerPicker,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildWeekDays(String dayName, int dayNumber) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => UpsertFormController().onPressWeekDay(dayNumber),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              dayName,
              style: TextStyle(color: Colors.white),
            ),
            Checkbox(
              onChanged: (_) =>
                  UpsertFormController().onPressWeekDay(dayNumber),
              value: UpsertTaskStore.to.task.days.contains(dayNumber),
              fillColor: MaterialStateProperty.all<Color>(Colors.white),
              checkColor: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
