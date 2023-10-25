import 'package:coins_app/config/app_theme.dart';
import 'package:coins_app/pages/coin_page.dart';
import 'package:flutter/material.dart';



void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 0).theme(),
      title: "My Coins App",
      home:  CoinPage()
      );
  }
}