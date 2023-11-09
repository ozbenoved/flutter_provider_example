import 'package:flutter/material.dart';

class ImagesPlayerProvider with ChangeNotifier {
  ImagesPlayerProvider() : super();

  bool _isPlaying = false;

  bool get isPlaying => _isPlaying;

  void toggle() {
    _isPlaying = !_isPlaying;
    notifyListeners();
  }
}
