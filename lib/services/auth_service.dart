import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';

import '../api/firebase_constants.dart';
import '../api/models/requests/create_user_request.dart';
import 'base_service.dart';

@singleton
class AuthService extends BaseService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  AuthService();

  FirebaseFirestore get db => FirebaseFirestore.instance;

  FirebaseStorage get storage => FirebaseStorage.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  CollectionReference<Map<String, dynamic>> get users =>
      db.collection(FirebaseConstants.usersCollection);

  Future<void> signInWithGoogle() async {
    await makeErrorHandledCall(() async {
      final provider = GoogleAuthProvider();
      final credential = await _firebaseAuth.signInWithProvider(provider);
      final newUser = credential.user;
      if (newUser != null) {
        final userRecord = await users.doc(newUser.uid).get();
        if (!userRecord.exists) {
          _addGoogleUserToFirestore(newUser);
        }
        currentUser?.reload();
      }
    });
  }

  void _addGoogleUserToFirestore(User newUser) {
    final displayName = newUser.displayName;
    final emailAddress = newUser.email;
    final avatarURL = newUser.photoURL;
    if (emailAddress == null) {
      throw Exception('Email address is null');
    }
    late final String firstName;
    late final String lastName;
    if (displayName != null) {
      final displayNameInfo = displayName.split(' ');
      firstName = displayNameInfo.first;
      lastName = displayNameInfo.last;
    } else {
      final displayNameInfo = emailAddress.split('@');
      firstName = displayNameInfo.first;
      lastName = ' ';
    }
    users.doc(newUser.uid).set(
          CreateUserRequest(
            emailAddress: emailAddress,
            firstName: firstName,
            lastName: lastName,
            avatarUrl: avatarURL,
          ).toJson(),
        );
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
