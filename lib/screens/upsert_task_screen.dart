import 'package:simple_hour/index.dart';

class UpsertTaskScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.deeperBlue,
      appBar: AppBar(
        title: Text('Create'),
        backgroundColor: CustomColors.deeperBlue,
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: UpsertFormController().onSaveTask,
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Align(
                child: Text(
                  'Save',
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
            ),
          )
        ],
      ),
      body: GetBuilder<UpsertTaskStore>(
        init: UpsertTaskStore(),
        builder: (_) {
          return SingleChildScrollView(
            child: Center(
              child: Container(
                width: 300.0,
                child: UpsertForm(),
              ),
            ),
          );
        },
      ),
    );
  }
}
