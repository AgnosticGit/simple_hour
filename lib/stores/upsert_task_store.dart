import 'package:simple_hour/index.dart';

class UpsertTaskStore extends Store {
  static UpsertTaskStore get to => Get.put(UpsertTaskStore());

  TaskModel task = TaskModel(id: StopwatchStore.to.getLastIndex() + 1);
  UpsertErrorsModel errors = UpsertErrorsModel();

  void setTaskName(String name) {
    task.name = name;
    update();
  }

  void setTaskDuration(Duration duration) {
    task.duration = duration;
    update();
  }

  void setTaskInitialDuration(Duration duration) {
    task.initialDuration = duration;
    update();
  }

  void setNameError() {
    errors.name = 'Field name must not be empty';
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
