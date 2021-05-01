import 'package:simple_hour/index.dart';

class Task extends StatelessWidget {
  const Task({
    required this.task,
    this.onTap,
  });

  final TaskModel task;
  final void Function(TaskModel)? onTap;

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap == null ? null : () => onTap!(task),
      child: Container(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 20.0,
                  height: 20.0,
                  decoration: BoxDecoration(
                    color: _buildDoneColor(),
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                ),
                const SizedBox(width: 15.0),
                Text(
                  task.name,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            Text(
              ConverterService.getHumanityDuration(task.duration),
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Color _buildDoneColor() {
    if (task.done) return Colors.green;
    return Colors.red;
  }
}
