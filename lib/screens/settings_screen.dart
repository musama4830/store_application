import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = '/settings_screen';
  TextEditingController limitController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void _saveForm() {
      final check = int.parse(limitController.text);
      if (check <= 5) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Alert Message"),
              content: const Text('Enter Less Products Limit greater then 5.'),
              actions: <Widget>[
                FlatButton(
                    child: const Text('OK'),
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
              ],
            );
          },
        );
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Confirmation Message"),
              content: Text('Less Products Limit : $check'),
              actions: <Widget>[
                FlatButton(
                    child: const Text('OK'),
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      Provider.of<Products>(context, listen: false)
                          .updateLimit(check);
                      Navigator.of(context).pop();
                    }),
              ],
            );
          },
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveForm,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: limitController,
              autofocus: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Less Products Limit',
                hintText: 'Enter limit for less Products in Stock.',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
