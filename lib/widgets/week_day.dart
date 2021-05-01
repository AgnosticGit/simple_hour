import 'package:simple_hour/index.dart';

class WeekDay extends StatelessWidget {
  const WeekDay({
    required this.onTap,
    required this.dayName,
    required this.dayNumber,
    this.checkBoxValue,
  });

  final int dayNumber;
  final void Function(int dayNumber) onTap;
  final String dayName;
  final bool? checkBoxValue;

  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => onTap(dayNumber),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              dayName,
              style: TextStyle(color: Colors.white),
            ),
            Checkbox(
              onChanged: (_) => onTap(dayNumber),
              value: checkBoxValue,
              fillColor: MaterialStateProperty.all<Color>(Colors.white),
              checkColor: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
