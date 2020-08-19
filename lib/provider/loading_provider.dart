import 'package:flutter/cupertino.dart';

class LoadingProvider extends ChangeNotifier {
  bool _isLoading = false;

  void startLoading() {
    _isLoading = true;
    notifyListeners();
  }

  void stopLoading() {
    _isLoading = false;
    notifyListeners();
  }

  bool get isLoading => _isLoading;
}
