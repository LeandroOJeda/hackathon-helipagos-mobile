// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:async';

import 'package:coins_app/pages/nft_page.dart';
import 'package:coins_app/widgets/button_widget.dart';
import 'package:coins_app/widgets/coin_card.dart';
import 'package:flutter/material.dart';
import 'package:coins_app/widgets/total_balance.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:coins_app/models/coins.dart';

class CoinPage extends StatefulWidget {
  CoinPage({Key? key}) : super(key: key);

  @override
  State<CoinPage> createState() => _CoinPageState();
}

class _CoinPageState extends State<CoinPage> {
  Future<List<Coin>> fetchCoin() async {
    coinList = [];
    final response = await http.get(Uri.parse(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=10&page=1&sparkline=false&locale=en'));
    if (response.statusCode == 200) {
      List<dynamic> values = [];
      values = json.decode(response.body);
      if (values.length > 0) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            Map<String, dynamic> map = values[i];
            coinList.add(Coin.fromJson(map));
          }
        }
        setState(() {
          coinList;
        });
      }
      return coinList;
    } else {
      throw Exception("Failed to load, try again");
    }
  }

  String activeButton = 'Coins';

  @override
  void initState() {
    fetchCoin();
    Timer.periodic(const Duration(seconds: 60), ((timer) => fetchCoin()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: TotalBalance(),
            ),
            SliverToBoxAdapter(
                child: SizedBox(
              height: 75,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButtonWidget(
                    active: activeButton == 'Coins', 
                    onTap: () {
                      setState(() {
                        activeButton = "Coins";
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CoinPage()));
                    }, 
                    text: 'Coins'),
                  ButtonWidget(
                    active: activeButton == 'NFT', 
                    onTap: () {
                      setState(() {
                        activeButton = "NFT";
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Nft()));}, 
                        text: 'NFT'),
                  ButtonWidget(
                    active: activeButton == 'No preguntes', 
                    onTap: () {
                      setState(() {
                        activeButton = "No preguntes";
                      });
                    }, 
                    text: 'No preguntes'),
                ],
              ),
            )),
            SliverToBoxAdapter(
              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.3,
                child: ListView.builder(
                    itemCount: coinList.length,
                    itemBuilder: (context, index) {
                      return SingleChildScrollView(
                        child: CoinCard(
                            change: coinList[index].change.toDouble(),
                            changePercentage:
                                coinList[index].changePercentage.toDouble(),
                            image: coinList[index].image,
                            name: coinList[index].name,
                            price: coinList[index].price.toDouble(),
                            rank: coinList[index].rank.toInt(),
                            symbol: coinList[index].symbol),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}