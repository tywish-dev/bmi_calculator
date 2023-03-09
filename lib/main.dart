import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ui/providers/bmi_provider.dart';
import 'ui/view/screens/home_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ListenableProvider<BmiProvider>(create: (_) => BmiProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
