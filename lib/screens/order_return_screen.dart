import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/app_drawer.dart';
import '../providers/products.dart';
import '../providers/sales.dart';
import '../providers/profit.dart';

class OrderReturnScreen extends StatefulWidget {
  static const routeName = '/order_return_screen';

  @override
  State<OrderReturnScreen> createState() => _OrderReturnScreenState();
}

class _OrderReturnScreenState extends State<OrderReturnScreen> {
  TextEditingController productIdController = TextEditingController();
  TextEditingController productQuantityController = TextEditingController();
  String id = '';
  double quantity = 0;
  int profit = 0;

  void returnData() {
    id = productIdController.text;
    quantity = double.parse(productQuantityController.text);
    Product _product = Provider.of<Products>(context, listen: false).findById(id);
    Product _newItem = Product(
      id: _product.id,
      title: _product.title,
      totalQuantity: quantity,
      purchasePrice: (_product.purchasePrice * (quantity)).toInt(),
      salePrice: (_product.salePrice * (quantity)).toInt(),
    );
    profit = (_product.salePrice * (quantity) - _product.purchasePrice * (quantity)).toInt();

    //Updating Item quantity in products.dart file
    Provider.of<Products>(context, listen: false).returnProduct(id, quantity);

    //Updating Item in sales.dart file
    Provider.of<Items>(context, listen: false).returnItem(id, quantity, profit);

    //Updating Order in profit.dart file
    Provider.of<Orders>(context, listen: false).returnOrder(profit);

    setState(() {
      productIdController.clear();
      productQuantityController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Return'),
      ),
      drawer: AppDrawer(),
      body: Container(
        height: 300,
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 10),
              child: TextField(
                controller: productIdController,
                autofocus: true,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Products Id',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
              child: TextField(
                controller: productQuantityController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Products Quantity',
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.done),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: returnData,
      ),
    );
  }
}
