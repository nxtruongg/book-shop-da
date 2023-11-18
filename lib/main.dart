import 'package:flutter/material.dart';
import 'package:ontap3011/trangchu.dart';

Future<void> main(List<String> args) async {
  runApp(MyApp());
}

// Future<void> main(List<String> args) async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Menu(),
    );
  }
}
