import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'midas_m32.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(const FaycalMidasApp());
}

class FaycalMidasApp extends StatelessWidget {
  const FaycalMidasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Faycal Midas OSC',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.orangeAccent,
        scaffoldBackgroundColor: const Color(0xFF121212),
      ),
      home: const Scaffold(
        body: SafeArea(
          child: MidasM32Screen(),
        ),
      ),
    );
  }
}
