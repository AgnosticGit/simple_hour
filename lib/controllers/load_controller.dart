import 'package:simple_hour/index.dart';

class LoadController {
  void onApplicationReady() async {
    await HiveController().setTasksToStore();
    await onLastLoadInNewDay();
    TaskController().setFirstTaskToStore();
    StopwatchScreenController().setTaskListHeightByListLength();
    HiveController().setStatisticsToStore();
    _lifeCycleListener();
  }

  Future<void> onLastLoadInNewDay() async {
    if (!await HiveController().isLastDayToday()) {
      TaskController().refreshTasksTime();
      HiveController().setLastDateToHive();
      HiveController().setRawTasksToHive();
      HiveController().setTasksToStore();
    }
  }

  void _lifeCycleListener() {
    WidgetsBinding.instance!.addObserver(
      LifecycleService(
        resumeCallBack: () async {
          onApplicationMaximized();
        },
        pausedCallBack: () async {
          onApplicationMinimize();
        },
      ),
    );
  }

  void onApplicationMaximized() {
    final time = StopwatchStore.to.timeWhenApplicationPaused;
    final now = DateTime.now();

    if (time != null) {
      final timeDifference = now.difference(time).inSeconds;
      final currentDuration =
          StopwatchStore.to.selectedTask!.currentDuration.inSeconds;

      final differenceInSeconds = currentDuration - timeDifference;
      if (differenceInSeconds < 0) {
        StopwatchStore.to.setSelectedTaskState(TaskState.pause);
        StopwatchStore.to.timer?.cancel();
        StopwatchStore.to.setSelectedTaskCurrentDuration(const Duration());
      } else {
        StopwatchStore.to.setSelectedTaskCurrentDuration(
          Duration(seconds: differenceInSeconds),
        );
      }
    }
  }

  void onApplicationMinimize() {
    final selectedTask = StopwatchStore.to.selectedTask;
    if (selectedTask != null && selectedTask.state == TaskState.play) {
      StopwatchStore.to.setTimeWhenApplicationPaused(DateTime.now());
    }
  }
}
