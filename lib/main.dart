import 'package:simple_hour/index.dart';


void main() {
  runApp(SimpleHour());
}

class SimpleHour extends StatelessWidget {
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: ScreenSelector(),
    );
  }
}
