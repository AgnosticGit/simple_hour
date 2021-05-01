import 'package:simple_hour/index.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    required this.currentIndex,
    this.onTap,
  });

  final int currentIndex;
  final void Function(int)? onTap;

  Widget build(BuildContext context) {
    return SnakeNavigationBar.color(
      onTap: onTap,
      backgroundColor: CustomColors.deeperBlue,
      currentIndex: currentIndex,
      snakeViewColor: Colors.orange,
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.white,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.settings)),
        BottomNavigationBarItem(icon: Icon(Icons.timer)),
        BottomNavigationBarItem(icon: Icon(Icons.timeline)),
      ],
    );
  }
}
