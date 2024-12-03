import 'package:flutter/material.dart';
import 'market_card.dart';

class MarketSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MarketCard(name: "BA", price: "\$0.00000002378", change: "+12.9%", color: Colors.green),
        MarketCard(name: "MOB", price: "\$0.3962", change: "-2.1%", color: Colors.red),
        MarketCard(name: "GT", price: "\$8.930", change: "+5.1%", color: Colors.green),
      ],
    );
  }
}
