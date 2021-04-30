import 'package:simple_hour/index.dart';

class TaskManager extends StatelessWidget {
  Widget build(BuildContext context) {
    return GetBuilder<StopwatchStore>(
      init: StopwatchStore(),
      builder: (_) {
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
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (c, _) => SizedBox(height: 15.0),
                  itemCount: StopwatchStore.to.tasks.length,
                  itemBuilder: (_, index) {
                    return TaskAdvanced(
                      StopwatchStore.to.tasks[index],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
