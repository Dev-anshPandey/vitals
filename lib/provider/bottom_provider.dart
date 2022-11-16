import 'package:flutter/cupertino.dart';

class BottomProvider extends ChangeNotifier {
  int bottomNo = 0;
  void setBNo(int no) {
    bottomNo = no;
    notifyListeners();
  }
}
