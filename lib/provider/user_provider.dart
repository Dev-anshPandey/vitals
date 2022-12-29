import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier {
  String? url;
  bool isLoggenIn = false;
  void setUrl(String profileurl) {
    url = profileurl;
    print("url is : $url");
    notifyListeners();
  }

  geturl() {
    return url;
  }
}
