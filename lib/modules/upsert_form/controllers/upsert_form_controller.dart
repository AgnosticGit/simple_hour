import 'package:simple_hour/index.dart';
import 'package:simple_hour/stores/upsert_task_store.dart';

class UpsertFormController {
  void onInputTaskName(String name) {
    UpsertTaskStore.to.setTaskName(name);
  }

  void onPressWeekDay(int day) {
    final days = UpsertTaskStore.to.task.days;
    if (days.contains(day)) {
      UpsertTaskStore.to.removeTaskDay(day);
    } else {
      UpsertTaskStore.to.setTaskDay(day);
    }
  }

  void onChangeTimerPicker(Duration duration) {
    UpsertTaskStore.to.setTaskDuration(duration);
  }

  void onSaveTask() {
    final task = UpsertTaskStore.to.task;
    StopwatchStore.to.incertTask(task);
    Get.back();
  }
}
