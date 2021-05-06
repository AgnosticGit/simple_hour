import 'package:simple_hour/index.dart';

class Stopwatch extends StatelessWidget {
  const Stopwatch({
    this.task,
    this.onTapPlay,
    this.onTapPause,
    this.onTapRefresh,
    this.onTapCreate,
    this.emptyTask,
  });

  final TaskModel? task;
  final Widget? emptyTask;
  final void Function()? onTapPlay;
  final void Function()? onTapPause;
  final void Function()? onTapRefresh;
  final void Function()? onTapCreate;

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

  Widget? _buildStopwatchBody() {
    if (task != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.bottomCenter,
              width: Get.width * 0.6,
              child: Text(
                task!.name,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
            ),
          ),
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
            flex: 3,
            child: Align(
              alignment: Alignment.topCenter,
              child: _buildButton(),
            ),
          )
        ],
      );
    }

    if (emptyTask != null) {
      return emptyTask;
    }

    return const SizedBox();
  }

  Widget _buildButton() {
    if (task!.done) {
      return CircularButton(
        size: 50.0,
        child: Icon(
          Icons.refresh,
          size: 40.0,
        ),
        onTap: onTapRefresh,
      );
    }
    if (task?.state == TaskState.play) {
      return CircularButton(
        child: Icon(
          Icons.play_arrow_outlined,
          size: 50.0,
        ),
        onTap: onTapPlay,
      );
    }
    if (task?.state == TaskState.pause) {
      return CircularButton(
        size: 50.0,
        child: Icon(
          Icons.pause,
          size: 40.0,
        ),
        onTap: onTapPause,
      );
    }

    return const SizedBox();
  }
}
