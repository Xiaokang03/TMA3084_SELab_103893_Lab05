import 'package:flutter/foundation.dart';

class TabModel extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void select(int index) {
    if (index < 0 || index >= 4) return;
    if (index == _currentIndex) return;

    _currentIndex = index;
    notifyListeners();
  }
}
