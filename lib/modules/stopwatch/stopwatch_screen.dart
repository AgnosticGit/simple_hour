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
                onTapPlay: StopwatchController().onTapPlay,
                onTapPause: StopwatchController().onTapPause,
                onTapRefresh: StopwatchController().onTapRefresh,
                task: StopwatchStore.to.selectedTask,
                emptyTask: CircularButton(
                  color: Colors.transparent,
                  onTap: TaskController().onAddTask,
                  splashColor: Colors.orange,
                  size: Get.width * 0.8,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 100.0,
                  ),
                ),
              ),
            ),
          ),
        ),
        CustomDivider(
          margin: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
          color: Colors.white,
          height: 2.0,
          visible: StopwatchStore.to.tasks.length > 0,
        ),
        Expanded(
          child: TaskSnap(
            spaceBetweenElements: 20.0,
            listPadding: const EdgeInsets.all(10.0),
            selectedTask: StopwatchStore.to.selectedTask,
            tasks: StopwatchStore.to.tasks,
            selectedBorderColor: Colors.orange,
            borderColor: Colors.white,
            onTapTask: StopwatchController().onSelectTask,
          ),
        ),
      ],
    );
  }
}
