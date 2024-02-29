import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iitj_rent_sell/Home/home_screen.dart';
import 'package:iitj_rent_sell/services/email_auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmailAuth extends StatefulWidget {
  const EmailAuth({Key? key}) : super(key: key);

  static const String id = 'emailAuth-screen';

  @override
  State<EmailAuth> createState() => _EmailAuthState();
}

class _EmailAuthState extends State<EmailAuth> {

  final _formKey = GlobalKey<FormState>();

  bool _validate = false;
  bool _login = false;
  bool _loading = false;

  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();

  EmailAuthentication _service = EmailAuthentication();

  _validateEmail() async {
    if(_formKey.currentState!.validate()){
      setState(() {
        _validate = false;
        _loading = true;
      });
      UserCredential value = await _service.getAdminCredential(
          email: _emailController.text,
          password: _passwordController.text,
          isLog: _login,
          context: context,
      );
      setState(() {
        _loading = false;
      });
      if (value!.user!.uid.isNotEmpty) {
        print("in auth ui dart.......");
        print(value);
        SharedPreferences sp = await SharedPreferences.getInstance();
        await sp!.setString("uid", value!.user!.uid);
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>HomeScreen()));
      }

    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.red.shade200,
              child: Icon(
                CupertinoIcons.person_alt_circle,
                color: Colors.red,
                size: 60,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text('Enter to ${_login ? 'Login' : 'Register'}'),
            SizedBox( height: 10,),
            Text('Enter Email and Password to ${_login ? 'Login' : 'Register'}'),
            SizedBox(height: 10,),
            TextFormField(
              controller: _emailController,
              validator: (value){
                final bool isValid = EmailValidator.validate(_emailController.text);
                if(value == null || value.isEmpty){
                  return 'Enter email';
                } else if(RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@iitj.ac.in").hasMatch(value)){
                  return null;
                }
                return 'Invalid Email (Enter your institute email).';
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10),
                labelText: 'Email',
                filled: true,
                fillColor: Colors.grey.shade300,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(4),),
              ),
            ),
            SizedBox(height: 10 ,),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10),
                labelText: 'Password',
                filled: true,
                fillColor: Colors.grey.shade300,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(4),),
              ),
              onChanged: (value){
                if(_emailController.text.isNotEmpty){
                  if(value.length > 3){
                    setState(() {
                      _validate = true;
                    });
                  }
                  else{
                    setState(() {
                      _validate = false;
                    });
                  }
                }
              },
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Text(_login ? 'New Account ?' : 'Already has an account?'),
                TextButton(child: Text(_login? 'Register' : 'Login',
                  style: TextStyle(color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold
                  ),
                ),
                  onPressed: (){
                  setState(() {
                    _login = !_login;
                  });
                  },
                )
              ],
            )
          ],
        ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(padding: const EdgeInsets.all(12.0),
        child: AbsorbPointer(
          absorbing: _validate ? false : true,
          child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: _validate
                    ? MaterialStateProperty.all(Theme.of(context).primaryColor)
                    : MaterialStateProperty.all(Colors.grey),
              ),
            onPressed: (){
                _validateEmail();
            },
            child: Padding(padding: const EdgeInsets.all(12.0),
              child: _loading ? SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ) : Text(
                '${_login ? 'Login' : 'Register'}',
                style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        ),
      ),
    );
  }
}
