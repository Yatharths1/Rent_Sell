import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SellPage extends StatefulWidget {
  const SellPage({super.key});

  @override
  State<SellPage> createState() => _SellPageState();
}

class _SellPageState extends State<SellPage> {

  final titleController = TextEditingController();
  final priceController = TextEditingController();
  final contactController = TextEditingController();
  final detailsController = TextEditingController();

  handleSubmit() async {

    SharedPreferences sp = await SharedPreferences.getInstance();
    String? uid = await sp!.getString("uid");

    final db = FirebaseFirestore.instance;
    
    db.collection("Product")
      .add({
      "title": titleController.text,
      "price": priceController.text,
      "contact": contactController.text,
      "details": detailsController.text,
      "uid":  uid,
    }).then((value) => print(value));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: titleController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 10),
            labelText: 'Item Title',
            filled: true,
            fillColor: Colors.grey.shade300,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(4),),
          ),
        ),
        SizedBox(height: 10,),
        TextFormField(
          controller: priceController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 10),
            labelText: 'Item Price',
            filled: true,
            fillColor: Colors.grey.shade300,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(4),),
          ),
        ),
        SizedBox(height: 10,),
        TextFormField(
          controller: contactController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 10),
            labelText: 'Contact No.',
            filled: true,
            fillColor: Colors.grey.shade300,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(4),),
          ),
        ),
        SizedBox(height: 10,),
        TextFormField(
          controller: detailsController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 10),
            labelText: 'Item Details',
            filled: true,
            fillColor: Colors.grey.shade300,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(4),),
          ),
        ),
        // SizedBox(height: 10,),
        // TextFormField(
        //   decoration: InputDecoration(
        //     contentPadding: EdgeInsets.only(left: 10),
        //     labelText: 'Category',
        //     filled: true,
        //     fillColor: Colors.grey.shade300,
        //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(4),),
        //   ),
        // ),
        SizedBox(height: 10,),
        ElevatedButton(
            onPressed: handleSubmit,
            child: Text("Upload"))
      ],
    );
  }
}
