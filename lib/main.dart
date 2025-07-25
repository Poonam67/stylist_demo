import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tyreplex_demo/ui/views/home_view.dart';
import 'core/di/locator.dart';
import 'core/providers/product_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomeView()
    );
  }
}
