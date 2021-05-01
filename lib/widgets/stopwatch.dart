import 'package:simple_hour/index.dart';

class Stopwatch extends StatelessWidget {
  const Stopwatch({
    this.task,
    this.onTapPlay,
    this.onTapPause,
    this.onTapRefresh,
  });

  final TaskModel? task;
  final void Function()? onTapPlay;
  final void Function()? onTapPause;
  final void Function()? onTapRefresh;

  Widget build(BuildContext context) {
    return Container(
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
      child: _buildStopwatchBody(),
    );
  }

  Widget _buildStopwatchBody() {
    if (task != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(flex: 4, child: const SizedBox()),
          Expanded(
            flex: 4,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                ConverterService.getHumanityDuration(task!.duration),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: Get.width * 0.1,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircularButton(
                  
                  child: Icon(
                    Icons.play_arrow_outlined,
                  
                    size: 50.0,
                  ),
                  onTap: () {},
                ),
              ],
            ),
          )
        ],
      );
    }

    return const SizedBox();
  }

  Widget _buildButton(){
    return SizedBox();
  }
}
