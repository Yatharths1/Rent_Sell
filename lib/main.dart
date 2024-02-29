import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:iitj_rent_sell/Home/home_screen.dart';
import 'firebase_options.dart';
import 'package:iitj_rent_sell/Login%20Register/login.dart';
import 'package:iitj_rent_sell/Widgets/auth_ui.dart';
import 'package:iitj_rent_sell/splash.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp fbapp =  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  print(fbapp);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(Duration(seconds: 3)),
        builder: (context, AsyncSnapshot snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                home: SplashScreen()
            );
          } else {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  primaryColor: Colors.cyan.shade900
              ),
              // home: HomeScreen(),
              home: EmailAuth(),
              routes: {
                SplashScreen.id: (context) => SplashScreen(),
                Login.id: (context) => Login(),
                EmailAuth.id: (context) => EmailAuth(),
                HomeScreen.id: (context) => HomeScreen(),

              },
            );
          }
        }
    );
  }
}
