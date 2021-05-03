import 'package:simple_hour/index.dart';

class TaskManager extends StatelessWidget {
  const TaskManager({
    required this.tasks,
  });

  final List<TaskModel> tasks;

  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: TaskController().onAddTask,
              child: Icon(Icons.add),
            ),
          ),
          const SizedBox(height: 10.0),
          Expanded(
            child: ListView.separated(
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
