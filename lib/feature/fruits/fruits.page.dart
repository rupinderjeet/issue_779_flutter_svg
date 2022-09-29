import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'fruit.dart';
import 'fruits.model.dart';
import 'widget/filterchip/filter_chip_layout.dart';

class FruitsPage extends StatefulWidget {
  const FruitsPage({Key? key}) : super(key: key);

  @override
  State<FruitsPage> createState() => _FruitsPageState();
}

class _FruitsPageState extends State<FruitsPage> {
  FruitsModel get _fruitsModel => context.read<FruitsModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        ElevatedButton(
            onPressed: _loadFruits, child: const Text("Load Fruits")),
        Selector<FruitsModel, List<Fruit>>(
            selector: (_, model) => model.fruits,
            builder: (_, fruits, __) {
              return _FruitsFilterChipLayout(
                  fruits: fruits,
                  onRemoveTap: (fruit) {
                    _fruitsModel.removeSelectedFruit(fruit);
                  });
            }),
      ]),
    );
  }

  void _loadFruits() {
    final fruits = [
      Fruit(name: "Apple"),
      Fruit(name: "Man"),
      Fruit(name: "Go"),
      Fruit(name: "Ban"),
      Fruit(name: "Chilly"),
    ];
    _fruitsModel.setSelectedFruits(fruits);
  }
}

class _FruitsFilterChipLayout extends StatelessWidget {
  const _FruitsFilterChipLayout({
    Key? key,
    required this.fruits,
    required this.onRemoveTap,
  }) : super(key: key);

  final List<Fruit> fruits;
  final Function(Fruit) onRemoveTap;

  @override
  Widget build(BuildContext context) {
    return FilterChipLayout(
      items: fruits.map(_fruitToChipItem).toList(),
    );
  }

  FilterChipItem _fruitToChipItem(Fruit fruit) {
    return FilterChipItem(
      text: fruit.name,
      action: () => onRemoveTap(fruit),
    );
  }
}
