import 'package:simple_hour/index.dart';

class HiveService {
  static void setTasks(List<Map<String, dynamic>> newTasks) async {
    final tasks = await Hive.openBox('tasks');
    await tasks.put('tasks', newTasks);
  }

  static Future<List<Map<String, dynamic>>> getTasks() async {
    final tasksBox = await Hive.openBox('tasks');
    if (tasksBox.isEmpty) return [];

    final t = await Hive.openBox('name');
    final tasksNonTyped = await tasksBox.get('tasks');
    final tasks = tasksNonTyped
        .map<Map<String, dynamic>>((e) => Map<String, dynamic>.from(e))
        .toList();

    return tasks;
  }
}
