import 'package:simple_hour/index.dart';
import 'package:simple_hour/services/hive_service.dart';
import 'package:simple_hour/stores/upsert_task_store.dart';

class UpsertController {
  void onInputTaskName(String name) {
    UpsertTaskStore.to.setTaskName(name);
  }

  void onChangeTimerPicker(Duration duration) {
    UpsertTaskStore.to.setTaskDuration(duration);
    UpsertTaskStore.to.setTaskInitialDuration(duration);
  }

  void onSaveTask() {
    if (!_hasErrors()) {
      TaskController().setNewTaskToStore();
      HiveController().setRawTasksToHive();
      Get.back();
    }
  }

  bool _hasErrors() {
    final task = UpsertTaskStore.to.task;
    UpsertTaskStore.to.clearErrors();
    if (task.nameIsEmpty) UpsertTaskStore.to.setNameError();

    if (task.durationIsZero) UpsertTaskStore.to.setDurationError();
    return task.nameIsEmpty || task.durationIsZero;
  }
}
