import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/profit.dart';

class ProfitScreen extends StatelessWidget {
  static const routeName = '/profit_screen';
  int? _todayProfit, _weekProfit, _monthProfit;

  @override
  Widget build(BuildContext context)  {
     Provider.of<Orders>(context, listen: false).showProfit();
    _todayProfit = Provider.of<Orders>(context, listen: false).todayProfit;
    _weekProfit = Provider.of<Orders>(context, listen: false).weekProfit;
    _monthProfit = Provider.of<Orders>(context, listen: false).monthProfit;

    showPro(String title, int value) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w800,
              fontSize: 16,
            ),
          ),
          Container(
            width: 120,
            padding: const EdgeInsets.all(15.0),
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Text(
                value.toString(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profit'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            showPro("Today's Profit", _todayProfit!.toInt()),
            showPro("Week's Profit", _weekProfit!.toInt()),
            showPro("Month's Profit", _monthProfit!.toInt()),
          ],
        ),
      ),
    );
  }
}
