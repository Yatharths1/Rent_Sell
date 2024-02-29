import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iitj_rent_sell/Widgets/auth_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'ProductTile.dart';

class MyItems extends StatefulWidget {
  const MyItems({super.key});

  @override
  State<MyItems> createState() => _MyItemsState();
}

class _MyItemsState extends State<MyItems> {

  List<Map<String, dynamic>> products = [];

  _MyItemsState() {
    print("ldjhfdlkjghfkghfdlkghf");
    handleLoad();
  }

  handleLogOut() async {
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>EmailAuth()));
  }

  handleLoad() async {

    SharedPreferences sp = await SharedPreferences.getInstance();
    String? uid = await sp!.getString("uid");
    print(uid);

    final db = FirebaseFirestore.instance;

    db.collection("Product").where('uid', isEqualTo: uid).get().then((qs) {
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
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          products.map((p) {
            return ProductTile(title: p['title'], price: p['price'], contact: p['contact'], details: p['details']);
          }).toList(),

        ),
        ElevatedButton(
            onPressed: handleLogOut,
            child: Text("Log Out"))
      ],
    );
  }
}
