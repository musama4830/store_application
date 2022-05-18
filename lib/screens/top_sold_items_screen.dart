import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/sold_items_list.dart';
import '../providers/sales.dart';

class TopSoldItemsScreen extends StatelessWidget {
  static const routeName = '/top_sold_items_screen';

  @override
  Widget build(BuildContext context) {
    List<Item> topItems = Provider.of<Items>(context, listen: false).sortItems;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Sold Items'),
      ),
      body: ListView.builder(
        itemCount: topItems.length,
        itemBuilder: (_, i) => Column(
          children: [
            SoldItemsList(
              topItems[i].id,
              topItems[i].title,
              topItems[i].quantity,
              topItems[i].profit,
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
