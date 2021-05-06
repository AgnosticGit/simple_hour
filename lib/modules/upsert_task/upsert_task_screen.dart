import 'package:flutter/cupertino.dart';
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
            onTap: UpsertController().onSaveTask,
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
          return Center(
            child: Container(
              width: 300.0,
              child: Column(
                children: [
                  const SizedBox(height: 20.0),
                  ErrorText(text: UpsertTaskStore.to.errors.name),
                  const SizedBox(height: 10.0),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white,
                          spreadRadius: 4,
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Input(
                      hintText: 'Enter Task Name',
                      onChanged: UpsertController().onInputTaskName,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  ErrorText(text: UpsertTaskStore.to.errors.duration),
                  const SizedBox(height: 10.0),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white,
                          spreadRadius: 4,
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: CupertinoTheme(
                      data: CupertinoThemeData(brightness: Brightness.dark),
                      child: CupertinoTimerPicker(
                        initialTimerDuration: const Duration(hours: 1),
                        onTimerDurationChanged:
                            UpsertController().onChangeTimerPicker,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
