import 'package:cafedential/AuthenticateScreen/login_screen.dart';
import 'package:cafedential/AuthenticateScreen/register_screen.dart';
import 'package:cafedential/AuthenticateScreen/welcome_screen.dart';
import 'package:cafedential/nav.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';
import 'root.dart';
import 'package:firebase_auth/firebase_auth.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationProvider>(
          create: (_) => AuthenticationProvider(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthenticationProvider>().authStateChanges, initialData: null,
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
          // scaffoldBackgroundColor: Colors.brown[900],
          scaffoldBackgroundColor: const Color.fromARGB(255, 241, 255, 232)
          // scaffoldBackgroundColor: const Color.fromARGB(255, 236, 243, 178),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: Authenticate.id,
        routes: {
          LoginScreen.id: (context) => const LoginScreen(),
          Nav.id: (context) => const Nav(),
          Register.id: (context) => const Register(),
          Welcome.id: (context) => const Welcome(),
          Authenticate.id: (context) => const Authenticate(),
        },
      ),
    );
  }
}

class Authenticate extends StatelessWidget {
  static const id = 'auth';

  const Authenticate({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    // ignore: unnecessary_null_comparison
    if (firebaseUser != null) {
      return const Nav();
    }
    return const Welcome();
  }
}
