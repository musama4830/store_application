import 'package:flutter/material.dart';

class SoldItemsList extends StatelessWidget {
  final String id;
  final String title;
  final double quantity;
  final int totalSalePrice;

  SoldItemsList(this.id, this.title, this.quantity, this.totalSalePrice);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: FittedBox(
          fit: BoxFit.fill,
          child: Text(id),
        ),
      ),
      title: Text(title),
      subtitle: Text(quantity.toString()),
      trailing: Text(totalSalePrice.toString()),
    );
  }
}
