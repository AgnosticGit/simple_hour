import 'package:simple_hour/index.dart';

class HiveService {
  static Future setTasks() async{
    final tasks = await Hive.openBox('tasks');
    return tasks.get('tasks');
  }
}