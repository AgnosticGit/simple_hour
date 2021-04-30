import 'package:simple_hour/index.dart';

class Stopwatch extends StatelessWidget {
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: CustomColors.deepBlue30,
          borderRadius: BorderRadius.circular(Get.width),
          boxShadow: [
            BoxShadow(
              color: Colors.white,
              spreadRadius: 10,
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: const SizedBox()),
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  '1:13:10',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Get.width * 0.1
                  ),
                ),
              ),
            ),
            Expanded(
              child: Text(
                '66%',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: Get.width * 0.05
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
