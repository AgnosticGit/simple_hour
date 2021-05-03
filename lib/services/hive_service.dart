import 'package:simple_hour/index.dart';

class HiveService {
  static void setTasks(List<Map<String, dynamic>> newTasks) async {
    final tasks = await Hive.openBox('tasks');
    await tasks.put('tasks', newTasks);
  }

  static Future<List<Map<String, dynamic>>> getTasks() async {
    final tasksBox = await Hive.openBox('tasks');
    if (tasksBox.isEmpty) return [];

    final tasksNonTyped = await tasksBox.get('tasks');
    final tasks = tasksNonTyped
        .map<Map<String, dynamic>>((e) => Map<String, dynamic>.from(e))
        .toList();
    return tasks;
  }

  static Future removeTask(TaskModel task) async {
    final tasks = await getTasks();
    tasks.removeWhere((element) => element['id'] == task.id);
    setTasks(tasks);
  }

  static Future setStatistics(List<Map<String, dynamic>> newStats) async {
    final statsBox = await Hive.openBox('statistics');
    await statsBox.put('statistics', newStats);
  }

  static Future<List<Map<String, dynamic>>> getStatistics() async {
    final statsBox = await Hive.openBox('statistics');
    if (statsBox.isEmpty) return [];

    final statsNonTyped = await statsBox.get('statistics');
    final stats = statsNonTyped
        .map<Map<String, dynamic>>((e) => Map<String, dynamic>.from(e))
        .toList();
    return stats;
  }

  static Future removeStatsByTask(TaskModel task) async {
    final stats = await getStatistics();
    stats.forEach((stat) {
      stat['tasks'].removeWhere((t) => t['id'] == task.id);
    });
    setStatistics(stats);
  }
}
