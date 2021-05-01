import 'package:simple_hour/index.dart';

class ErrorText extends StatelessWidget {
  const ErrorText({this.text});

  final String? text;

  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      style: TextStyle(
        color: Colors.red,
        fontSize: 12.0,
      ),
    );
  }
}
