import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../screens/profit_screen.dart';
import '../screens/qr_code_scanning_screen.dart';
import '../screens/top_sold_items_screen.dart';
import '../screens/less_stoke_items_screen.dart';
import '../screens/settings_screen.dart';
import '../widgets/app_drawer.dart';
import '../widgets/sold_items_list.dart';
import '../providers/products.dart';
import '../providers/sales.dart';
import '../providers/profit.dart';

enum FilterOptions {
  Profit,
  TopSoldItems,
  LessStokeItems,
  Settings,
}

class SalesDashboard extends StatefulWidget {
  static const routeName = '/';

  @override
  _SalesDashboardState createState() => _SalesDashboardState();
}

class _SalesDashboardState extends State<SalesDashboard> {
  TextEditingController productIdController = TextEditingController();
  TextEditingController productQuantityController = TextEditingController();
  String id = '';
  double quantity = 0;
  int profit = 0;
  int totalSale = 0;
  int toatlPurchase = 0;

  List<Product> saleItems = [];

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    void saleItem() {
      id = productIdController.text;
      quantity = double.parse(productQuantityController.text);
      Product _product = Provider.of<Products>(context, listen: false).findById(id);
      Product _newItem = Product(
        id: _product.id,
        title: _product.title,
        totalQuantity: quantity,
        purchasePrice: (_product.purchasePrice * (quantity)).toInt(),
        salePrice: (_product.salePrice * (quantity)).toInt(),
        image: _product.image,
      );

      profit = (_product.salePrice * (quantity) -
              _product.purchasePrice * (quantity))
          .toInt();

      //Adding Item in ListView
      saleItems.add(_newItem);
      totalSale += (_product.salePrice * (quantity)).toInt();
      toatlPurchase += (_product.purchasePrice * (quantity)).toInt();

      //Adding Item in sales.dart file
      Item _item = Item(
          id: id,
          title: _product.title,
          quantity: quantity,
          profit: profit);
      Provider.of<Items>(context, listen: false).addItems(_item);

      //Updating Item quantity from products.dart file
      Provider.of<Products>(context, listen: false).saleProduct(id.toString(), quantity);

      setState(() {
        saleItems;
        totalSale;
        toatlPurchase;
        productIdController.clear();
        productQuantityController.clear();
      });
    }

    void savedata() {
      //Adding Order in profit.dart file
      id = DateFormat('yyyy-MM-dd').format(DateTime.now());
      profit = totalSale - toatlPurchase;
      Order _order = Order(
        id: id,
        totalProfit: profit,
      );
      Provider.of<Orders>(context, listen: false).addOrder(_order);

      setState(() {
        saleItems.clear();
        totalSale = 0;
        toatlPurchase = 0;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sales Dashboard'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.qr_code_scanner),
            onPressed: () {
              Navigator.of(context).pushNamed(QrCodeScanningScreen.routeName);
            },
          ),
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Profit) {
                  Navigator.of(context).pushNamed(ProfitScreen.routeName);
                } else if (selectedValue == FilterOptions.TopSoldItems) {
                  Navigator.of(context).pushNamed(TopSoldItemsScreen.routeName);
                } else if (selectedValue == FilterOptions.LessStokeItems) {
                  Navigator.of(context)
                      .pushNamed(LessStokeItemsScreen.routeName);
                } else if (selectedValue == FilterOptions.Settings) {
                  Navigator.of(context).pushNamed(SettingsScreen.routeName);
                }
              });
            },
            icon: const Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) => [
              const PopupMenuItem(
                child: Text('Profit'),
                value: FilterOptions.Profit,
              ),
              const PopupMenuItem(
                child: Text('Top Sold Items'),
                value: FilterOptions.TopSoldItems,
              ),
              const PopupMenuItem(
                child: Text('Less Stoke Items'),
                value: FilterOptions.LessStokeItems,
              ),
              const PopupMenuItem(
                child: Text('Settings'),
                value: FilterOptions.Settings,
              ),
            ],
          )
        ],
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              color: Theme.of(context).primaryColor.withOpacity(0.1),
              height: (mediaQuery.size.height - mediaQuery.padding.top) * 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
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
            Container(
              padding: const EdgeInsets.all(5),
              height: (mediaQuery.size.height - mediaQuery.padding.top) * 0.5,
              child: ListView.builder(
                itemCount: saleItems.length,
                itemBuilder: (_, i) => Column(
                  children: [
                    SoldItemsList(
                      saleItems[i].id,
                      saleItems[i].title,
                      saleItems[i].totalQuantity,
                      saleItems[i].salePrice,
                    ),
                    const Divider(),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                height: (mediaQuery.size.height - mediaQuery.padding.top) * 0.1,
                child: ElevatedButton(
                  child: Text('Total Price : $totalSale'),
                  onPressed: savedata,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.done),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: saleItem,
      ),

      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: Stack(
      //   fit: StackFit.expand,
      //   children: [
      //     Positioned(
      //       bottom: 70,
      //       right: 15,
      //       child: FloatingActionButton(
      //         child: const Icon(Icons.qr_code_scanner),
      //         backgroundColor: Theme.of(context).primaryColor,
      //         onPressed: () {/* Do something */},
      //       ),
      //     ),
      //     Positioned(
      //       bottom: 0,
      //       right: 15,
      //       child: FloatingActionButton(
      //         child: const Icon(Icons.done),
      //         backgroundColor: Theme.of(context).primaryColor,
      //         onPressed: () {/* Do something */},
      //       ),
      //     ),
      //     // Add more floating buttons if you want
      //     // There is no limit
      //   ],
      // ),
    );
  }
}
