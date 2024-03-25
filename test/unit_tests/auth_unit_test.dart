import 'package:flutter_test/flutter_test.dart';
import 'package:cafedential/AuthenticateScreen/auth_methods/email_and_password_auth.dart';
import 'package:cafedential/AuthenticateScreen/auth_methods/auth_enum.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/mockito.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {
  @override
  Future<UserCredential> signInWithEmailAndPassword({
    String? email,
    String? password,
  }) {
    return super.noSuchMethod(
      Invocation.method(
        #signInWithEmailAndPassword,
        [],
        {#email: email, #password: password},
      ),
      returnValue: Future.value(MockUserCredential()),
    );
  }
}

class UserModel {
  final String email;
  final String displayName;

  UserModel({required this.email, required this.displayName});

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      email: user.email ?? '',
      displayName: user.displayName ?? '',
    );
  }
}

class MockFirebaseUser extends Mock implements User {}
class MockUserCredential extends Mock implements UserCredential {}
class MockFirebaseFirestore extends Mock implements FirebaseFirestore {}


void main() {
  group('EmailAndPasswordAuth', () {
    late EmailandPasswordAuth emailandPasswordAuth;
    late MockFirebaseUser mockUser;
    late MockUserCredential mockCredential;

    setUp(() {
      emailandPasswordAuth = EmailandPasswordAuth();
      mockCredential = MockUserCredential();
      mockUser = MockFirebaseUser();
      when(mockCredential.user).thenReturn(mockUser);
    });


    test('signInWithEmailAndPassword - EmailOrPasswordInvalid', () async {
      final result = await emailandPasswordAuth.signInWithEmailAndPassword(
        email: 'test@example.com',
        password: 'wrongpassword',
      );
      expect(result, EmailSignInResults.EmailOrPasswordInvalid);
    });


    test('signUpAuth - Error', () async {
      final result = await emailandPasswordAuth.signUpAuth(
        email: 'user001@gmail.com',
        password: 'user001',
        name: 'Test User',
      );
      expect(result, EmailSignUpResults.Error);
    });
  });
}
