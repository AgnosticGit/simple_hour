import 'package:simple_hour/index.dart';


class ScreenSelector extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.deeperBlue,
      bottomNavigationBar: BottomNavigation(),
      body: LayoutBuilder(
        builder: (_, c) {
          return GetBuilder<StopwatchStore>(
            init: StopwatchStore(),
            builder: (_) {
              return _pageSelector();
            },
          );
        },
      ),
    );
  }

  Widget _pageSelector() {
    final index = StopwatchStore.to.currentNavigationIndex;
    if (index == 2) return StatisticsScreen();
    return StopwatchScreen();
  }
}
