import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final db = FirebaseFirestore.instance;
String? value;
String? image;
String? des;
String? type;
String? product;
String? status;
String? desc;
String? price; // use num data type
String? available;
bool isUpdate=false;

class AddProduct extends StatelessWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Product'),),
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: ListView(
          children: [
            ListTile(
              // width: MediaQuery.of(context).size.width * 0.9,
              title: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      // Used a ternary operator to check if isUpdate is true then display
                      // Update name.
                      labelText: isUpdate ? 'Update Product' : 'Add Product',
                      hintText: 'Enter Product Name',
                    ),
                    onChanged: (String _val) {
                      // Storing the value of the text entered in the variable value.
                      product = _val;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      // Used a ternary operator to check if isUpdate is true then display
                      // Update name.
                      labelText: isUpdate ? 'Update Product' : 'Add Product',
                      hintText: 'Enter Product Name',
                    ),
                    onChanged: (String _val) {
                      // Storing the value of the text entered in the variable value.
                      desc = _val;
                    },
                  ),

                  TextField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      // Used a ternary operator to check if isUpdate is true then display
                      // Update name.
                      labelText: isUpdate ? 'Update Product' : 'Add Product',
                      hintText: 'Enter Product Name',
                    ),
                    onChanged: (String _val) {
                      // Storing the value of the text entered in the variable value.
                      status = _val;
                    },
                  ),
                  
                ],
              ),
            ),
            TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.lightBlueAccent),
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
                    : const Text('ADD Product', style: TextStyle(color: Colors.white))),
          ],
        ),
      ),
    );
  }
}
