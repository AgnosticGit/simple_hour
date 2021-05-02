import 'package:simple_hour/index.dart';

void main() async {
  await Hive.initFlutter();
  runApp(SimpleHour());
}

class SimpleHour extends StatelessWidget {
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScreenSelector(),
    );
  }
}
