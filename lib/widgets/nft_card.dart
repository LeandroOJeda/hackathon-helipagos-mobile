import 'package:flutter/material.dart';

class NftCard extends StatelessWidget {
  final String name;
  final String symbol;
  final String image;
  final Text description;
  final num price;

  const NftCard({
    super.key, 
    required this.name, 
    required this.symbol, 
    required this.image, 
    required this.description, 
    required this.price});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}