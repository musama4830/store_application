import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import './providers/products.dart';
import './providers/sales.dart';
import './providers/profit.dart';
import './screens/profit_screen.dart';
import './screens/top_sold_items_screen.dart';
import './screens/less_stoke_items_screen.dart';
import './screens/settings_screen.dart';
import './screens/sales_dashboard_screen.dart';
import './screens/user_products_screen.dart';
import './screens/edit_product_screen.dart';
import './screens/order_return_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Items(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Orders(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'My Store',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato',
          ),
          home: SalesDashboard(),
          routes: {
            ProfitScreen.routeName: (ctx) => ProfitScreen(),
            TopSoldItemsScreen.routeName: (ctx) => TopSoldItemsScreen(),
            LessStokeItemsScreen.routeName: (ctx) => LessStokeItemsScreen(),
            UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
            EditProductScreen.routeName: (ctx) => EditProductScreen(),
            SettingsScreen.routeName: (ctx) => SettingsScreen(),
            OrderReturnScreen.routeName: (ctx) => OrderReturnScreen(),
          }),
    );
  }
}
