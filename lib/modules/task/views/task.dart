import 'package:simple_hour/index.dart';


class Task extends StatelessWidget {
  Task(this.name, this.duration, this.done);

  final String name;
  final Duration duration;
  final bool done;

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child:  Container(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 20.0,
                  height: 20.0,
                  decoration: BoxDecoration(
                    color: _buildDoneColor(),
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                ),
                const SizedBox(width: 15.0),
                Text(
                  name,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            Text(
              ConverterService.getHumanityDuration(duration),
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Color _buildDoneColor() {
    if (done) return Colors.green;
    return Colors.red;
  }
}
