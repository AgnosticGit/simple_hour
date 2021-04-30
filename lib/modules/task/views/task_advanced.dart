import 'package:simple_hour/index.dart';
import 'package:simple_hour/services/converter_service.dart';

class TaskAdvanced extends StatelessWidget {
  TaskAdvanced(this.task);

  final TaskModel task;

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
                icon: Icon(
                  Icons.edit,
                  size: 15,
                  color: Colors.white,
                ),
                onTap: () {},
              ),
              const SizedBox(width: 15.0),
              CircularButton(
                color: Colors.red,
                icon: Icon(
                  Icons.delete,
                  size: 15,
                  color: Colors.white,
                ),
                onTap: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
