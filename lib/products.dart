// import 'package:deliveryapp/addproduct.dart';
// import 'package:deliveryapp/menucard.dart';
// import 'package:deliveryapp/singlemenu.dart';
// import 'package:deliveryapp/table.dart';
import 'package:deliveryapp/scan.dart';
import 'package:deliveryapp/singleproduct.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final db = FirebaseFirestore.instance;
String table = 'undefined';

class Products extends StatefulWidget {
  const Products({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ScanQrPage()),
          );
        },
        child: const Icon(Icons.qr_code),
      ),
      body: StreamBuilder(
        // Reading Items form our Database Using the StreamBuilder widget
        stream: db
            .collection('products')
            .where("status", isEqualTo: widget.title)
            .snapshots(),
        // orderBy("product").
        //where("type",isEqualTo: widget.title).orderBy("cat")
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: ListView.builder(
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, int index) {
                DocumentSnapshot documentSnapshot = snapshot.data.docs[index];
                // return Container(
                //   child: ListTile(
                //     title: Column(
                //       children: [
                //         Card(
                //           clipBehavior: Clip.antiAlias,
                //           child: Column(
                //             children: [
                //               ListTile(
                //                 onTap: () => {
                //                   Navigator.push(
                //                     context,
                //                     MaterialPageRoute(
                //                       builder: (context) => Catpage(
                //                           title: documentSnapshot['product'],
                //                           table: table,
                //                           type: widget.title),
                //                     ),
                //                   )
                //                 },
                //                 title: Text(documentSnapshot['product']),
                //                 // title:Text(documentSnapshot['table']) ,
                //               ),
                //             ],
                //           ),
                //         )
                //       ],
                //     ),
                //   );
                // );
                // return Expanded(
                //   child: Padding(
                //     padding: const EdgeInsets.symmetric(
                //       horizontal: 24,
                //     ),
                //     child: ListView(
                //       padding: const EdgeInsets.only(
                //         top: 5,
                //       ),
                // physics: const BouncingScrollPhysics(),
                //       children: [
                //         const SizedBox(
                //           height: 20,
                //         ),
                //         InkWell(
                //           onTap: () {
                //             Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                   builder: (context) => const AddProduct()),
                //             );
                //             //  Navigator.push(
                //             //                         context,
                //             //                         MaterialPageRoute(
                //             //                           builder: (context) => Catpage(
                //             //                               title: documentSnapshot['product'],
                //             //                               table: table,
                //             //                               type: widget.title),
                //             //                         ),
                //             //                       )
                //           },
                //           child: const TileCard(
                //             icon: Icons.delivery_dining,
                //             titleName: 'Speaking skills',
                //             subtitleName: '16 Excercises',
                //             color: Colors.green,
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // );
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: InkWell(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => const AddProduct()),
                      // );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SingleProduct(
                            title: documentSnapshot['product'],
                            status: documentSnapshot['status'],
                            id: documentSnapshot.id,
                          ),
                        ),
                      );
                    },
                    child: TileCard(
                      icon: Icons.delivery_dining,
                      titleName: documentSnapshot['product'],
                      subtitleName: documentSnapshot['desc'],
                      color: Colors.green,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// addNewOrder(BuildContext context) {
//   // Added the isUpdate argument to check if our item has been updated
//   return Padding(
//     padding: const EdgeInsets.only(top: 20),
//     child: Column(
//       children: [
//         SizedBox(
//           width: MediaQuery.of(context).size.width * 0.9,
//           child: Column(
//             children: [
//               TextField(
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                   // Used a ternary operator to check if isUpdate is true then display
//                   // Update name.
//                   labelText: 'User table',
//                   hintText: 'Enter table',
//                 ),
//                 onChanged: (String _val) {
//                   // Storing the value of the text entered in the variable value.
//                   table = _val;
//                 },
//               ),
//             ],
//           ),
//         ),
//         TextButton(
//             style: ButtonStyle(
//               backgroundColor: MaterialStateProperty.all(Colors.green),
//             ),
//             onPressed: () {
//               db.collection('tables').add({'table': table});
//               Navigator.pop(context);
//             },
//             child: const Text(
//               'Ok',
//               style: TextStyle(color: Colors.white),
//             )),
//       ],
//     ),
//   );
// }

class TileCard extends StatelessWidget {
  final icon;
  final String titleName;
  final String subtitleName;
  final color;

  const TileCard({
    Key? key,
    required this.icon,
    required this.titleName,
    required this.subtitleName,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade200, spreadRadius: 1, blurRadius: 2)
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      color: color,
                      child: Icon(
                        icon,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        titleName,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        subtitleName,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.grey),
                      )
                    ],
                  ),
                ],
              ),
              // Icon(
              //   Icons.circle,
              //   color: color,
              //   size: 14,
              // )
            ],
          )),
    );
  }
}
