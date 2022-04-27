import 'package:flutter/foundation.dart';

class CounterModel with ChangeNotifier {
  bool clean = false;

  // 写方法
  void cleanAll() {
    clean = true;
    notifyListeners(); // 通知听众刷新

  }
}
