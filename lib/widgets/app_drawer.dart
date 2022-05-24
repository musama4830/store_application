import 'package:flutter/material.dart';

import '../screens/user_products_screen.dart';
import '../screens/order_return_screen.dart';
import '../screens/qr_code_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: const Text('My Store!'),
            automaticallyImplyLeading: false,
          ),
          const SizedBox(height: 10,),
          ListTile(
            leading: const Icon(Icons.shop),
            title: const Text('Sales Dashboard'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Manage Products'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(UserProductsScreen.routeName);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.reset_tv_rounded),
            title: const Text('Order Return'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(OrderReturnScreen.routeName);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.qr_code),
            title: const Text('Products QR_Code'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(QrcodeScreen.routeName);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              // Navigator.of(context).pushReplacementNamed('/');
            },
          ),
        ],
      ),
    );
  }
}
