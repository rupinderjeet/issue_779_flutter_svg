import 'package:flutter/material.dart';
import 'package:flutter_svg_github779/feature/fruits/fruits.model.dart';
import 'package:flutter_svg_github779/feature/fruits/fruits.page.dart';
import 'package:great_list_view/great_list_view.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  _initMain();

  runApp(const MyApp());
}

void _initMain() async {
  /// Isolate instantiation can block main thread. Hence, frame drops are
  /// possible. So, it is better to warm yp the executor beforehand.
  /// From https://pub.dev/packages/worker_manager
  /// For https://pub.dev/packages/great_list_view
  await Executor().warmUp();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (_) => FruitsModel(),
        child: const FruitsPage(),
      ),
      title: 'Sample flutter_svg@779',
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
