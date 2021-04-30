class ConverterService {
  static String getHumanityDuration(Duration duration) {
    final dur = duration.toString().split(':');
    final hours = dur[0];
    final minutes = dur[1];
    final seconds = dur[2].split('.').first;
    return "${hours}h ${minutes}m ${seconds}s";
  }
}
