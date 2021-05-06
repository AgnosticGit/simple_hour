import 'package:simple_hour/index.dart';
import 'package:simple_hour/services/converter_service.dart';

class TaskAdvanced extends StatelessWidget {
  const TaskAdvanced({
    required this.task,
    this.onTap,
  });

  final TaskModel task;
  final void Function()? onTap;

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 15.0),
          Expanded(
            child: Text(
              task.name,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: Text(
              ConverterService.getHumanityDuration(task.currentDuration),
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(width: 10.0),
          CircularButton(
            color: Colors.red,
            size: 30.0,
            child: Icon(
              Icons.delete,
              size: 20.0,
              color: Colors.white,
            ),
            onTap: () => TaskController().onRemoveTask(task),
          ),
          const SizedBox(width: 10.0),
        ],
      ),
    );
  }
}
