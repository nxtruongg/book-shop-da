import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:bookshop/trangchu.dart';

import 'firebase_options.dart';
Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Menu(),
    );
  }
}
