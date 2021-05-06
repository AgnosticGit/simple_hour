import 'package:simple_hour/index.dart';

class TaskSnap extends StatelessWidget {
  const TaskSnap({
    required this.tasks,
    this.onTapTask,
    this.selectedTask,
    this.listPadding,
    this.borderColor,
    this.selectedBorderColor,
    this.spaceBetweenElements,
  });

  final List<TaskModel> tasks;
  final void Function(TaskModel)? onTapTask;
  final TaskModel? selectedTask;
  final EdgeInsets? listPadding;
  final Color? borderColor;
  final Color? selectedBorderColor;
  final double? spaceBetweenElements;

  Widget build(BuildContext context) {
    return ListView.separated(
      padding: listPadding,
      separatorBuilder: (_, c) => SizedBox(height: spaceBetweenElements),
      itemCount: tasks.length,
      itemBuilder: (_, index) {
        return Task(
          borderColor: _borderColorIfSelected(index),
          task: tasks[index],
          onTap: onTapTask,
        );
      },
    );
  }

  Color _borderColorIfSelected(int index) {
    if (borderColor != null) {
      if (selectedBorderColor == null) return borderColor!;

      if (tasks[index].id == selectedTask?.id) {
        return selectedBorderColor!;
      }
      return borderColor!;
    }
    return Colors.transparent;
  }
}
