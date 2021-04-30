import 'package:simple_hour/index.dart';

class UpsertTaskStore extends Store {
  static UpsertTaskStore get to => Get.put(UpsertTaskStore());

  TaskModel task = TaskModel(days: []);

  void setTaskName(String name) {
    task.name = name;
    update();
  }

  void setTaskDuration(Duration duration) {
    task.duration = duration;
    update();
  }

  void setTaskDay(int day) {
    task.days.add(day);
    update();
  }

  void removeTaskDay(int day) {
    task.days.remove(day);
    update();
  }
}
