import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod/riverpod.dart';
import 'package:todyapp/core/constants/firebase_constants.dart';
import 'package:todyapp/core/failure.dart';
import 'package:todyapp/core/providers/firebase_providers.dart';

import 'package:todyapp/core/type_defs.dart';
import 'package:todyapp/models/usermodel.dart';

final authRepositoryProvider = Provider(
  (ref) => AuthRepository(
      firestore: ref.read(firestoreProvider),
      auth: ref.read(authProvider),
      googleSignIn: ref.read(googleSignInProvider)),
);

final userIdProvider = StateProvider<String?>((ref) => null);

// Replace with actual path

class AuthRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;

  AuthRepository({
    required FirebaseFirestore firestore,
    required FirebaseAuth auth,
    required GoogleSignIn googleSignIn,
  })  : _firestore = firestore,
        _auth = auth,
        _googleSignIn = googleSignIn;

  CollectionReference get _users =>
      _firestore.collection(FirebaseConstants.usersCollection);

  FutureEither<UserModel> signInWithGoogle({required bool isFromLogin}) async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        return left(Failure("Google Sign-In was cancelled"));
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential;

      if (isFromLogin) {
        userCredential = await _auth.signInWithCredential(credential);
      } else {
        userCredential =
            await _auth.currentUser!.linkWithCredential(credential);
      }

      final user = userCredential.user;
      if (user == null) {
        return left(Failure("Google sign-in failed: No user data."));
      }

      final userDoc = await _users.doc(user.uid).get();

      late UserModel userModel;

      if (!userDoc.exists) {
        userModel = UserModel(
          name: user.displayName ?? "No Name",
          email: user.email ?? "",
          id: user.uid,
          password: "",
          confirm: "",
        );
        await _users.doc(user.uid).set(userModel.toMap());
      } else {
        userModel = UserModel.fromMap(userDoc.data() as Map<String, dynamic>);
      }

      return right(userModel);
    } on FirebaseAuthException catch (e) {
      return left(Failure(e.message ?? "FirebaseAuth error occurred."));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
