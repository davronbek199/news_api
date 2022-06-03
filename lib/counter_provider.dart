import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int index = 0;

  void increment() {
    index = index + 1;
    notifyListeners();
  }

  void decrement() {
    if (index >= 0) {
      index = index - 1;
    }
    notifyListeners();
  }
}
