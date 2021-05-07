import 'package:flutter/foundation.dart';
import 'package:simple_hour/index.dart';

class LifecycleService extends WidgetsBindingObserver {
  LifecycleService({
    this.resumeCallBack,
    this.detachedCallBack,
    this.inactiveCallBack,
    this.pausedCallBack,
  });

  final AsyncCallback? resumeCallBack;
  final AsyncCallback? detachedCallBack;
  final AsyncCallback? inactiveCallBack;
  final AsyncCallback? pausedCallBack;

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.resumed:
        if (resumeCallBack != null) await resumeCallBack!();
        break;
      case AppLifecycleState.inactive:
        if (inactiveCallBack != null) await inactiveCallBack!();
        break;
      case AppLifecycleState.paused:
        if (pausedCallBack != null) await pausedCallBack!();
        break;
      case AppLifecycleState.detached:
        if (detachedCallBack != null) await detachedCallBack!();
        break;
    }
  }
}
