import 'package:flutter/material.dart';

import 'fruit.dart';

class FruitsModel with ChangeNotifier {
  List<Fruit> _fruits = [
    Fruit(name: "Apple"),
    Fruit(name: "Anna"),
    Fruit(name: "Chilly"),
  ];

  List<Fruit> get fruits => _fruits;

  void setSelectedFruits(List<Fruit> fruits) {
    _fruits = fruits;
    notifyListeners();
  }

  void removeSelectedFruit(Fruit fruit) {
    final fruits = _fruits.toList();
    fruits.removeWhere((element) => (element.name == fruit.name));
    _fruits = fruits;
    notifyListeners();
  }
}