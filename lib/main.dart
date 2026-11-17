import 'package:flutter/material.dart';

import 'auth/login_page.dart';
import 'auth/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const SikaraApp());
}

class SikaraApp extends StatelessWidget {
  const SikaraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SIKARA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF274D16),
          primary: const Color(0xFF274D16),
          surface: const Color(0xFFFAFDF8),
        ),
      ),
      home: const SplashScreen(),
      routes: {'/login': (context) => const LoginPage()},
    );
  }
}
