import 'package:simple_hour/index.dart';

class TaskManager extends StatelessWidget {
  const TaskManager({
    required this.tasks,
  });

  final List<TaskModel> tasks;

  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.only(bottom: 80.0, top: 5.0),
              separatorBuilder: (c, _) => SizedBox(height: 15.0),
              itemCount: StopwatchStore.to.tasks.length,
              itemBuilder: (_, index) {
                return TaskAdvanced(task: tasks[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
