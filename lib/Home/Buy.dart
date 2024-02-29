import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iitj_rent_sell/Home/ProductTile.dart';

class BuyPage extends StatefulWidget {
  const BuyPage({super.key});

  @override
  State<BuyPage> createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> {

  List<Map<String, dynamic>> products = [];
  _BuyPageState() {
    handleLoad();
  }

  handleLoad() async {
    final db = FirebaseFirestore.instance;

    db.collection("Product").get().then((qs) {
      final allData = qs.docs.map((doc) => doc.data()).toList();
      setState(() {
        products = allData;
        print(products);
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
        products.map((p) {
          return ProductTile(title: p['title'], price: p['price'], contact: p['contact'], details: p['details']);
        }).toList(),
    );
  }
}
