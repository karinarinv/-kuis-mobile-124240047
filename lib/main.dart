import 'package:flutter/material.dart';
import 'views/login.dart';

void main() => runApp(const PokemonApp());

class PokemonApp extends StatelessWidget {
  const PokemonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFF9A825)),
        scaffoldBackgroundColor: const Color(0xFFFDF7FF),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF9A825),
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
      ),
      home: const LoginPage(),
    );
  }
}