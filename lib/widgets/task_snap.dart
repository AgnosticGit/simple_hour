import 'package:simple_hour/index.dart';

class TaskSnap extends StatelessWidget {
  const TaskSnap({required this.tasks});

  final List<TaskModel> tasks;

  Widget build(BuildContext context) {
    return GetBuilder<StopwatchStore>(
      init: StopwatchStore(),
      builder: (_) {
        return Container(
          child: ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (_, index) {
              return Task(
                task: tasks[index],
              );
            },
          ),
        );
      },
    );
  }
}
