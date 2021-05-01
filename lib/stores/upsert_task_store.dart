import 'package:simple_hour/index.dart';

class UpsertTaskStore extends Store {
  static UpsertTaskStore get to => Get.put(UpsertTaskStore());

  TaskModel task = TaskModel(id: StopwatchStore.to.getLastIndex(), days: []);
  UpsertErrorsModel errors = UpsertErrorsModel();

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

  void setNameError() {
    errors.name = 'Field name must not be empty';
    update();
  }

  void setDaysError() {
    errors.days = 'Choose at least one day';
    update();
  }

  void setDurationError() {
    errors.duration = 'Duration must not be 0 ';
    update();
  }

  void clearErrors() {
    errors = UpsertErrorsModel();
    update();
  }
}
