import 'package:deliveryapp/allcats.dart';
import 'package:deliveryapp/deliverd.dart';
import 'package:deliveryapp/products.dart';
import 'package:deliveryapp/search.dart';
import 'package:deliveryapp/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
// import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyAp-V-qVJ07OhyTL3-VtvwGKHkkWs3pLOY",
        authDomain: "delivery-app-9b900.firebaseapp.com",
        projectId: "delivery-app-9b900",
        storageBucket: "delivery-app-9b900.appspot.com",
        messagingSenderId: "550951656776",
        appId: "1:550951656776:android:c39d3e10141bb6e11d677d"),
  );
  runApp(
    const MyApp(),
  );
}

final db = FirebaseFirestore.instance;
String? value;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        routes: {
          'allcats': (ctx) {
            return const AllCats(
              title: 'IN',
            );
          },
          'search': (ctx) {
            return const Searchbar();
          },
        },
        home: const SplashScreen());
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Home())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: const [
            SizedBox(
              height: 500,
              child: Center(
                child: Image(
                  image: AssetImage('assets/delivery.png'),
                  alignment: Alignment.center,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Center(child: Text('Delivery App',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20),))
          ],
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: const NavDrawer(),
          appBar: AppBar(
            // systemOverlayStyle: const SystemUiOverlayStyle(
            //   // Status bar color
            //   statusBarColor: Colors.green,

            //   // Status bar brightness (optional)
            //   statusBarIconBrightness:
            //       Brightness.light, // For Android (dark icons)
            //   statusBarBrightness: Brightness.light, // For iOS (dark icons)
            // ),
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.delivery_dining_rounded),
                  text: 'To Deliver',
                ),
                Tab(
                  icon: Icon(Icons.delivery_dining_outlined),
                  text: 'Deliverd',
                ),
              ],
            ), // TabBar
            title: const Text('Delivery App'),
            centerTitle: true,
            backgroundColor: Colors.green,
          ), // AppBar
          body: const TabBarView(
            children: [
              Products(title: 'todeliver'),
              DeliverdProducts(title: 'deliverd'),
            ],
          ), // TabBarView
        ), // Scaffold
      ), // DefaultTabController,
    );
  }
}
