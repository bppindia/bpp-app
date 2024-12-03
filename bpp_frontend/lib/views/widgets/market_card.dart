import 'package:flutter/material.dart';

class MarketCard extends StatelessWidget {
  final String name;
  final String price;
  final String change;
  final Color color;

  MarketCard({required this.name, required this.price, required this.change, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
        Text(price, style: TextStyle(fontSize: 16)),
        Text(change, style: TextStyle(color: color)),
      ],
    );
  }
}
