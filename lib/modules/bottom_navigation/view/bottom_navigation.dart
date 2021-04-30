import 'package:simple_hour/index.dart';

class BottomNavigation extends StatelessWidget {
  Widget build(BuildContext context) {
    return GetBuilder<StopwatchStore>(
      init: StopwatchStore(),
      builder: (_) {
        return SnakeNavigationBar.color(
          onTap: BottomNavController().onNavigate,
          backgroundColor: CustomColors.deeperBlue,
          currentIndex: StopwatchStore.to.currentNavigationIndex,
          snakeViewColor: Colors.orange,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.settings)),
            BottomNavigationBarItem(icon: Icon(Icons.timer)),
            BottomNavigationBarItem(icon: Icon(Icons.timeline)),
          ],
        );
      },
    );
  }
}
