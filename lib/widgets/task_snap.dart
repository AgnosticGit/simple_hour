import 'package:simple_hour/index.dart';

class TaskSnap extends StatelessWidget {
  const TaskSnap({
    required this.tasks,
    this.onTapTask,
    this.selectedTask,
  });

  final List<TaskModel> tasks;
  final void Function(TaskModel)? onTapTask;
  final TaskModel? selectedTask; 

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
                onTap: onTapTask,
              );
            },
          ),
        );
      },
    );
  }
}
