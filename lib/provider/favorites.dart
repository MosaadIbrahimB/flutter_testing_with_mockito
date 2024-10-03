import 'package:flutter/material.dart';

class FavoritesProvider extends ChangeNotifier {
  final List<int> _favoriteItems = [];

  List<int> get items => _favoriteItems;

  void add(int index) {
    if (!_favoriteItems.contains(index)) {
      _favoriteItems.add(index);
    }
    notifyListeners();
  }

  void remove(int index) {
    _favoriteItems.remove(index);
    notifyListeners();
  }
}
