import 'package:simple_hour/index.dart';
import 'package:simple_hour/services/hive_service.dart';
import 'package:simple_hour/stores/upsert_task_store.dart';

class UpsertController {
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
    if (!_hasErrors()) {
      _saveToStore();
      _saveToHive();
      Get.back();
    }
  }

  bool _hasErrors() {
    final task = UpsertTaskStore.to.task;
    UpsertTaskStore.to.clearErrors();
    if (task.nameIsEmpty) UpsertTaskStore.to.setNameError();
    if (task.daysIsEmpty) UpsertTaskStore.to.setDaysError();
    if (task.durationIsZero) UpsertTaskStore.to.setDurationError();
    return task.nameIsEmpty || task.daysIsEmpty || task.durationIsZero;
  }

  void _saveToStore() {
    final task = UpsertTaskStore.to.task;
    StopwatchStore.to.incertTask(task);
  }

  void _saveToHive() {
    final tasksJsonList = StopwatchStore.to.tasksJsonList;
    HiveService.setTasks(tasksJsonList);
  }
}
