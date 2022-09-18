import 'package:cafedential/AuthenticateScreen/auth_methods/auth_enum.dart';
import 'package:cafedential/AuthenticateScreen/auth_methods/auth_methods.dart';
import 'package:cafedential/AuthenticateScreen/auth_methods/email_and_password_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import '../../nav.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final EmailandPasswordAuth _emailAndPasswordAuth = EmailandPasswordAuth();
  final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  // late String email;
  // late String password;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.white,
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: const BoxConstraints(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const Center(
                      child: Text(
                        'LogIn',
                        style: TextStyle(
                          fontFamily: 'Billabong',
                          color: Colors.black,
                          fontSize: 70.0,
                          fontWeight: FontWeight.w500,
                        )
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 230.0,
                      child: Lottie.asset('assets/login-coffee.json'),
                      // child: Lottie.network('https://assets8.lottiefiles.com/packages/lf20_nik29bnh.json'),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Form(
                      key: _loginKey,
                      child: Column(
                        children: <Widget>[
                          commonTextFormField(
                            labeltext: 'Email',
                            validator: (inputVal){
                              if(!emailRegExp.hasMatch(inputVal.toString())) {
                                return 'Enter a valid email';
                              }
                              return null;
                            }, 
                            controller: _emailController
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          commonTextFormField(
                            labeltext: 'Password',
                            validator: (inputVal){
                              if(inputVal.toString().length < 6) {
                                return 'Password must be atleast 6 characters';
                              }
                              return null;
                            }, 
                            controller: _passwordController
                          ),
                        ],
                      ),
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      child: Container(
                        // padding: EdgeInsets.fromLTRB(20.0, 20.0, 50.0, 10.0),
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Colors.purple,
                                Colors.deepPurple,
                                Colors.blueAccent
                              ],
                              begin: Alignment.bottomRight,
                              end: Alignment.topLeft,
                            ),
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                        child: TextButton(
                            onPressed: () async {
                              if(_loginKey.currentState!.validate()) {
                                print('Validated');
                                SystemChannels.textInput.invokeMethod('TextInput.hide');
                                setState(() {
                                  showSpinner = true;
                                });
                                final EmailSignInResults emailSignInResults = await _emailAndPasswordAuth.signInWithEmailAndPassword( email: _emailController.text, password: _passwordController.text);
                                String msg = "";
                                if(emailSignInResults == EmailSignInResults.SignInComplete) {
                                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Nav()), (route) => false);
                                } else if (emailSignInResults == EmailSignInResults.EmailNotVerified){
                                  msg = "Email not verified.\nPlease verify your email";
                                } else if (emailSignInResults == EmailSignInResults.EmailOrPasswordInvalid){
                                  msg = "Email or password is invalid";
                                } else if (emailSignInResults == EmailSignInResults.UnexpectedError){
                                  msg = "Unexpected error";
                                } else{
                                  msg = "Sign in failed";
                                }

                                if(msg != ""){
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
                                }
                              }
                              setState(() {
                                showSpinner = false;
                              });
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
