import 'package:simple_hour/index.dart';

class ScreenSelector extends StatelessWidget {
  Widget build(BuildContext context) {
    return GetBuilder<StopwatchStore>(
      init: StopwatchStore(),
      initState: (_) => LoadController().onApplicationReady(),
      builder: (_) {
        return Scaffold(
          backgroundColor: CustomColors.deeperBlue,
          bottomNavigationBar: BottomNavigation(
            currentIndex: StopwatchStore.to.currentNavigationIndex,
            onTap: ScreenSelectorController().onNavigate,
          ),
          floatingActionButton: StopwatchStore.to.currentNavigationIndex == 2
              ? FloatingActionButton.extended(
                  onPressed: TaskController().onAddTask,
                  label: Text('Add Task'),
                )
              : null,
          body: LayoutBuilder(
            builder: (_, c) {
              return _pageSelector();
            },
          ),
        );
      },
    );
  }

  Widget _pageSelector() {
    final index = StopwatchStore.to.currentNavigationIndex;
    if (index == 2) return StatisticsScreen();
    return StopwatchScreen();
  }
}
