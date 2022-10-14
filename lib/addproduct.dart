import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final db = FirebaseFirestore.instance;
String? product;
String? status = 'todeliver';
String? desc;

bool isUpdate=false;

class AddProduct extends StatelessWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Product'),),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: ListView(
          children: [
            ListTile(
              // width: MediaQuery.of(context).size.width * 0.9,
              title: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        // Used a ternary operator to check if isUpdate is true then display
                        // Update name.
                        labelText: isUpdate ? 'Update Product' : 'Product Name',
                        hintText: 'Enter Product Name',
                      ),
                      onChanged: (String _val) {
                        // Storing the value of the text entered in the variable value.
                        product = _val;
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: isUpdate ? 'Update Product' : 'Product Description',
                        hintText: 'Enter Product Description',
                      ),
                      onChanged: (String _val) {
                        desc = _val;
                      },
                    ),
                  ),

                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: TextField(
                  //     decoration: InputDecoration(
                  //       border: const OutlineInputBorder(),
                  //       labelText: isUpdate ? 'Update Product' : 'Product Status',
                  //       hintText: 'Enter Product Status',
                  //     ),
                  //     onChanged: (String _val) {
                  //       status = _val;
                  //     },
                  //   ),
                  // ),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: SizedBox(
                height: 40,
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.green),
                    ),
                    onPressed: () {
                      // Check to see if isUpdate is true then update the value else add the value
                      if (isUpdate) {
                        // db.collection('product').doc(documentSnapshot?.id).update({
                        //   'cat': product,
                        //   // 'type': type,
                        // });
                      } else {
                        db.collection('products').add({
                          'product': product,
                          'status': status,
                          'desc': desc,
                          // 'type': type,
                        });
                      }
                      Navigator.pop(context);
                    },
                    child: isUpdate
                        ? const Text(
                            'UPDATE',
                            style: TextStyle(color: Colors.white),
                          )
                        : const Text('Add Product', style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w400))),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
