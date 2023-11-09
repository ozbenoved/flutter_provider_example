import 'package:flutter/material.dart';
import 'package:home/home.dart';
import 'package:provider/provider.dart';
import 'package:state_management/state_management.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => NumberProvider()),
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
          ChangeNotifierProvider(create: (_) => ImagesPlayerProvider()),
          ChangeNotifierProvider(create: (_) => ImagesProvider())
        ],
        child: MaterialApp(
          title: 'Provider example',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const HomePage(),
        ));
  }
}
