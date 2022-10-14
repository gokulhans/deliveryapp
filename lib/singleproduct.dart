import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



final db = FirebaseFirestore.instance;

class SingleProduct extends StatelessWidget {
  const SingleProduct({Key? key, required this.title,required this.id, required this.status})
      : super(key: key);
  final String title;
  final String status;
  final String id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100, child: Center(child: Text(status))),
            TextButton(
                onPressed: () => {    
                  if (status == 'deliverd') {
                     db.collection('products').doc(id).update({
                    'title': title,
                    'status': 'todeliver',
                  })
                  } else {
                  db.collection('products').doc(id).update({
                    'title': title,
                    'status': 'deliverd',
                  })
                  }
                  }, child: Text('Change Status'))
          ],
        ),
      ),
    );
  }
}
