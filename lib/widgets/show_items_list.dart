import 'package:flutter/material.dart';

class ShowItemsList extends StatelessWidget {
  final String id;
  final String title;
  final double totalQuantity;

  ShowItemsList(this.id, this.title, this.totalQuantity);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: FittedBox(
            fit: BoxFit.fill,
            child: Text(id),
          ),
        ),
      ),
      trailing: Text(totalQuantity.toString()),
    );
  }
}