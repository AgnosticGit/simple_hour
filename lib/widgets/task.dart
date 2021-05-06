import 'package:simple_hour/index.dart';

class Task extends StatelessWidget {
  const Task({
    required this.task,
    this.onTap,
    this.borderColor = Colors.transparent,
  });

  final TaskModel task;
  final void Function(TaskModel)? onTap;
  final Color borderColor;

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap == null ? null : () => onTap!(task),
      child: Container(
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
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
                  Expanded(
                    child: Text(
                      task.name,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(width: 15.0),
            Text(
              ConverterService.getHumanityDuration(task.currentDuration),
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
