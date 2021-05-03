import 'package:simple_hour/index.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    this.color,
    this.height,
    this.margin ,
    this.visible = true,
  });

  final Color? color;
  final double? height;
  final EdgeInsets? margin;
  final bool visible;

  Widget build(BuildContext context) {
    if (!visible) return const SizedBox();
    return Container(
      margin: margin,
      color: Colors.white,
      height: height,
    );
  }
}
