import 'package:cafedential/AuthenticateScreen/auth_methods/auth_enum.dart';
import 'package:cafedential/AuthenticateScreen/auth_methods/auth_methods.dart';
import 'package:cafedential/AuthenticateScreen/auth_methods/email_and_password_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../nav.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Register extends StatefulWidget {
  static const String id = 'register';

  const Register({Key? key}) : super(key: key);
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _signupKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final EmailandPasswordAuth _emailAndPasswordAuth = EmailandPasswordAuth();
  late User user; //never gonna change

  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const Center(
                    child: Text(
                      'Register',
                      style: TextStyle(
                        fontFamily: 'Billabong',
                        color: Colors.black,
                        fontSize: 65.0,
                        fontWeight: FontWeight.w500,
                      )
                    ),
                  ),
                  SizedBox(
                    height: 200.0,
                    child: Lottie.asset('assets/register-coffee.json'),
                  ),
                  Form(
                    key: _signupKey,
                    child: Column(
                      children: [
                        commonTextFormField(labeltext: 'Name', validator: (inputVal){
                          if(inputVal!.isEmpty){
                            return 'Please enter your name';
                          }
                          return null;
                        }, controller: _nameController),
                        commonTextFormField(labeltext: 'Email', validator: (inputVal){
                          if(!emailRegExp.hasMatch(inputVal.toString())) {
                            return 'Enter a valid email';
                          }
                          return null;
                        }, controller: _emailController),
                        commonTextFormField(labeltext: 'Password', validator: (inputVal){
                          if(inputVal.toString().length < 6) {
                            return 'Password must be atleast 6 characters';
                          }
                          return null;
                        }, controller: _passwordController),
                      ],
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:50 ,vertical: 9.0),
                    child: Material(
                      color: Colors.blueAccent,
                      borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                      elevation: 5.0,
                      child: MaterialButton(
                        onPressed: () async {
                          if(_signupKey.currentState!.validate()) {
                            setState(() {
                              showSpinner = true;
                            });
                            try {
                              final EmailSignUpResults response = await _emailAndPasswordAuth.signUpAuth(email: _emailController.text, password: _passwordController.text, name: _nameController.text);
                              if (response == EmailSignUpResults.SignUpComplete) {
                                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Nav()), (route) => false);
                              } else {
                                String msg = (response == EmailSignUpResults.EmailAlreadyInUse)? 'Email already in use' : 'Sign up failed';
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(msg),
                                  ),
                                );
                              }
                            } catch (e) {
                              print(e);
                            } finally {
                              setState(() {
                                showSpinner = false;
                              });
                            }
                          }
                        },
                        minWidth: 200.0,
                        height: 42.0,
                        child: const Text(
                          'Register',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
