import 'package:flutter/cupertino.dart';

class BaseProvider extends ChangeNotifier {
  void update() {
    notifyListeners();
  }
}
