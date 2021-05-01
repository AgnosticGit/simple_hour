import 'package:simple_hour/index.dart';

class StopwatchScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 4,
          child: Container(
            padding: EdgeInsets.all(Get.width * 0.1),
            alignment: Alignment.center,
            child: AspectRatio(
              aspectRatio: 1.0,
              child: Stopwatch(
                task: StopwatchStore.to.selectedTask,
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
          color: Colors.white,
          height: 2.0,
        ),
        Expanded(
          child: TaskSnap(
            tasks: StopwatchStore.to.tasks,
            onTapTask: StopwatchController().onSelectTask,
          ),
        ),
      ],
    );
  }
}
