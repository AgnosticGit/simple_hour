import 'package:simple_hour/index.dart';

class CircularButton extends StatelessWidget {
  const CircularButton({
    this.onTap,
    this.child,
    this.size,
    this.color,
    this.splashColor,
  });

  final Function()? onTap;
  final double? size;
  final Widget? child;
  final Color? color;
  final Color? splashColor;

  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        width: size,
        height: size,
        child: Material(
          color: color,
          child: InkWell(
            splashColor: splashColor,
            child: child,
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}
