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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
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
          Row(
            children: [
              CircularButton(
                color: Colors.blue,
                size: 30.0,
                child: Icon(
                  Icons.edit,
                  size: 20.0,
                  color: Colors.white,
                ),
                onTap: () {},
              ),
              const SizedBox(width: 15.0),
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
            ],
          )
        ],
      ),
    );
  }
}
