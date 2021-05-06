import 'package:simple_hour/index.dart';

class ScreenSelectorController {
  void onNavigate(int index) {
    StopwatchStore.to.setCurrentNavigationIndex(index);
    TaskController().setLastTaskToStore();
  }
}
