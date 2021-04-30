import 'package:simple_hour/index.dart';

class TaskSnap extends StatelessWidget {
  Widget build(BuildContext context) {
    return GetBuilder<StopwatchStore>(
      init: StopwatchStore(),
      builder: (_) {
        return Container(
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (_, index) {
              return Task(
                'Английский',
                Duration(seconds: 10),
                false,
              );
            },
          ),
        );
      },
    );
  }
}
