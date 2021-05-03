import 'package:simple_hour/index.dart';

class ConverterService {
  static String getHumanityDuration(Duration duration) {
    final dur = duration.toString().split(':');
    final hours = dur[0];
    final minutes = dur[1];
    final seconds = dur[2].split('.').first;
    return "${hours}h ${minutes}m ${seconds}s";
  }

  static Duration parseDuration(String s) {
    int hours = 0;
    int minutes = 0;
    int micros;
    List<String> parts = s.split(':');
    if (parts.length > 2) {
      hours = int.parse(parts[parts.length - 3]);
    }
    if (parts.length > 1) {
      minutes = int.parse(parts[parts.length - 2]);
    }
    micros = (double.parse(parts[parts.length - 1]) * 1000000).round();
    return Duration(hours: hours, minutes: minutes, microseconds: micros);
  }

  static String getDateFromDateTime(DateTime datetime) {
    return datetime.toString().split(' ').first;
  }

  static List<Map<String, dynamic>> getTasksJsonList(List<TaskModel> tasks) {
    return tasks.map((e) => e.toJson()).toList();
  }

  static num getFormatFromSeconds(num seconds, ChartsYAxisFormat format) {
    if (format == ChartsYAxisFormat.minute) {
      return double.parse((seconds / 60).toStringAsFixed(1));
    }
    if (format == ChartsYAxisFormat.hour) {
      return double.parse((seconds / 3600).toStringAsFixed(1));
    }
    return seconds;
  }

  static String getDependFilterLabelFormat(ChartsYAxisFormat format) {
    if (format == ChartsYAxisFormat.hour) return "{value}h";
    if (format == ChartsYAxisFormat.minute) return "{value}m";
    return "{value}s";
  }
}
