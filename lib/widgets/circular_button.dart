import 'package:simple_hour/index.dart';

class CircularButton extends StatelessWidget {
  CircularButton({
    this.onTap,
    this.icon,
    this.size,
    this.color,
  });

  final Function()? onTap;
  final Icon? icon;
  final double? size;
  final Color? color;

  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: color,
        child: InkWell(
          child: SizedBox(
            width: size ?? 30,
            height: size ?? 30,
            child: icon,
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
