import 'package:flutter/material.dart';

class Nft {
  String name;
  String symbol;
  String image;
  Text description;
  num price;

  Nft({
    required this.name,
    required this.symbol,
    required this.image,
    required this.description,
    required this.price,
  });

  factory Nft.fromJson(Map<String, dynamic> json) {
    return Nft(
      name: json ["name"], 
      symbol: json ["symbol"], 
      image: json ["image"], 
      description: json ["description"], 
      price: json ["price"]
    );
  }
}

List<Nft> nftList = [];