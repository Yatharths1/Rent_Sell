

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EmailAuthentication{
  // CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<UserCredential> getAdminCredential({email, password, isLog, context}) async{
    // DocumentSnapshot _result = await users.doc(email).get();
    UserCredential user;
    if(isLog){
      user = await emailLogin(email,password,context);
    }else {
      user = await emailRegister(email, password, context);
    }
    return user;
  }

  emailLogin(email,password,context)async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print("logged in................... ");
      print(userCredential.user?.uid);
      return userCredential;

    } on FirebaseAuthException catch(e){
      if(e.code == 'user-not-found'){
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No user found for that email.'),
          ),
        );
      } else if(e.code == 'wrong-password'){
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Wrong password provided for that user.'),
          ),
        );
      }
    }
  }

  emailRegister(email,password,context)async{
    print("email reg");
    try{
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      if(userCredential.user?.uid!=null){
        // print(userCredential.user);
        // return users.doc(userCredential.user?.email).set({
        //   'uid' : userCredential.user?.uid,
        //   'mobile' : null,
        //   'email' : userCredential.user?.email
        // });
        return userCredential;
      }
    } on FirebaseAuthException catch(e){
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

}