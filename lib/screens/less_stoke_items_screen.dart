import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import '../widgets/show_items_list.dart';

class LessStokeItemsScreen extends StatelessWidget {
  static const routeName = '/less_stoke_items_screen';

  @override
  Widget build(BuildContext context) {
     final productsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Less Stoke Items'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: productsData.lessItems.length,
          itemBuilder: (_, i) => Column(
                children: [
                  ShowItemsList(
                    productsData.lessItems[i].id,
                    productsData.lessItems[i].title,
                    productsData.lessItems[i].totalQuantity,
                  ),
                  const Divider(),
                ],
              ),
        ),
      ),
    );
  }
}