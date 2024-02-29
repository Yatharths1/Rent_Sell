import 'package:flutter/material.dart';

class ProductTile extends StatefulWidget {
  final String title, price, contact, details;
  const ProductTile({super.key, required this.title, required this.price, required this.contact, required this.details});

  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      // width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title),
          Text('Price: Rs. ${widget.price}'),
          Text('Contact: ${widget.contact}'),
          Text(widget.details)
        ],
      ),
    );
  }
}
