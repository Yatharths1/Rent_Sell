import 'package:flutter/material.dart';
import 'package:iitj_rent_sell/Home/MyItems.dart';
import './Sell.dart';
import './Buy.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String id = 'home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override

  String toDisplay = "Buy";

  Widget getHW(String td) {
    if (td == "Buy") return BuyPage();
    if (td == "Sell") return SellPage();
    return MyItems();
  }
  Map<String, Widget> getHome = {
    "Buy": BuyPage(),
    "Sell": SellPage(),
    "My": MyItems(),
  };

  Widget build(BuildContext context) {

    return Scaffold(
      body: IntrinsicWidth(

        child: Container(
          padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    child: Text('Buy'),
                    onPressed: () => {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => BuyPage()))
                      setState(() {
                        toDisplay = "Buy";
                      })
                  },
                  ),

                  ElevatedButton(
                    child: Text('Sell'),
                    onPressed: () => {
                    // Navigator.push(context,MaterialPageRoute(builder: (context)=>SellPage()))
                      setState(() {
                        toDisplay = "Sell";
                      })
                    },
                  ),

                  ElevatedButton(
                    child: Text('My Items'),
                    onPressed: () => {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => BuyPage()))
                      setState(() {
                        toDisplay = "My";
                      })
                    },
                  ),
                ],
              ),
              SizedBox(height: 20,),
              // getHome[toDisplay] ?? SizedBox()
              getHW(toDisplay)
            ],

          ),
        ),
      ),
    );
  }
}

