import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cafedential/AuthenticateScreen/auth_methods/auth_enum.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'dart:convert' show utf8;

final _store = FirebaseFirestore.instance;

class EmailandPasswordAuth {
  Future<EmailSignUpResults> signUpAuth({required String name, required String email, required String password})async{
    try {
      final UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user!.email != null) {
        User user = userCredential.user!;
        user.updateDisplayName(name);
        _store.collection('users').doc(user.uid).set({
          'name': name,
          'email': email,
          'userid': user.uid,
          // 'pwd': utf8.encode(password),
        });
        // await userCredential.user!.sendEmailVerification();
        return EmailSignUpResults.SignUpComplete;
      } else {
        return EmailSignUpResults.SignUpFailed;
      }
    } catch (e) {
      // print(e.toString());
      return EmailSignUpResults.Error;
    }
  }
  Future<EmailSignInResults> signInWithEmailAndPassword({required String email, required String password})async{
    try {
      final UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user!.email != null) {
        return EmailSignInResults.SignInComplete;
      }
      // if (userCredential.user!.emailVerified) {
      //   return EmailSignInResults.SignInComplete;
      // } else {
      //   final bool logOutResponse = await logOut();
      //   if (logOutResponse) {
      //     return EmailSignInResults.EmailNotVerified;
      //   } else {
          return EmailSignInResults.UnexpectedError;
      //   }
      // }
    } catch (e) {
      // print(e.toString());
      return EmailSignInResults.EmailOrPasswordInvalid;
    }
  }
  Future<bool> logOut() async{
    try {
      await FirebaseAuth.instance.signOut();
      return true;
    } catch (e) {
      // print(e.toString());
      return false;
    }
  }
}