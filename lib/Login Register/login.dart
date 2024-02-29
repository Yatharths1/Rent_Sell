import 'package:flutter/material.dart';
import 'package:iitj_rent_sell/Widgets/auth_ui.dart';


class Login extends StatelessWidget {
  const Login({super.key});

  static const String id = 'login-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade900,
      body: Column(
        children: [
          Expanded(child: Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(height: 50,),
                Image.asset(
                    'assets/images/logo.jpg',
                ),
                SizedBox(height: 10,),
                Text('Buy, Sell or Rent',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                )
              ],
            ),
          )
          ),
          Expanded(child: Container(
            child: EmailAuth(),
          ))
        ],
      ),
    );
  }
}