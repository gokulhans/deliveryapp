import 'package:deliveryapp/addproduct.dart';
import 'package:deliveryapp/ordertracking.dart';
import 'package:deliveryapp/scan.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share_plus/share_plus.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(8),
                // color: Color.fromARGB(255, 43, 42, 40),
                child: Image.asset(
                  'assets/delivery.png',
                  width: 10,
                ),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),

          ListTile(
            leading: const Icon(Icons.delivery_dining),
            title: const Text('Add Product'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddProduct()),
              )
            },
          ),
          ListTile(
            leading: const Icon(Icons.qr_code),
            title: const Text('Scan QR'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ScanQrPage()),
              )
            },
          ),
          ListTile(
            leading: const Icon(Icons.qr_code),
            title: const Text('Order Tracking'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OrderTrackingPage()),
              )
            },
          ),
          // ListTile(
          //   leading: const Icon(Icons.table_bar),
          //   title: const Text('All Products'),
          //   onTap: () => {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => const AdminPage()),
          //     )
          //   },
          // ),
          // ListTile(
          //   leading: const Icon(Icons.table_bar),
          //   title: const Text('All Tables'),
          //   onTap: () => {Navigator.of(context).pushNamed('add')},
          // ),
          // ListTile(
          //   leading: const Icon(Icons.admin_panel_settings_outlined),
          //   title: const Text('Admin Page'),
          //   onTap: () => {Navigator.of(context).pushNamed('admin')},
          // ),
          // ListTile(
          //   leading: const Icon(Icons.search),
          //   title: const Text('Search Page'),
          //   onTap: () => {Navigator.of(context).pushNamed('search')},
          // ),
          // ListTile(
          //   leading: const Icon(Icons.category),
          //   title: const Text('All Categories'),
          //   onTap: () => {Navigator.of(context).pushNamed('categories')},
          // ),
          // ListTile(
          //   leading: const Icon(Icons.info),
          //   title: const Text('Test Page'),
          //   onTap: () => {Navigator.of(context).pushNamed('test')},
          // ),
        ],
      ),
    );
  }
}
