import 'package:simple_hour/index.dart';


class BottomNavController {
  void onNavigate(int index) {
    StopwatchStore.to.setCurrentNavigationIndex(index);
    StopwatchController().onSetLastTask();
  }
}
