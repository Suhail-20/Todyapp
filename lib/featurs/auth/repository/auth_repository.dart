import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod/riverpod.dart';
import 'package:todyapp/core/constants/constans.dart';
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

  Stream<User?> get authStateChange => _auth.authStateChanges();

  FutureEither<UserModel> signInWithGoogle(bool isFromLogin) async {
    try {
      UserCredential userCredential;

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        return left(Failure("Google Sign-In was cancelled"));
      }

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      if (isFromLogin) {
        userCredential = await _auth.signInWithCredential(credential);
      } else {
        userCredential =
            await _auth.currentUser!.linkWithCredential(credential);
      }

      UserModel userModel;

      if (userCredential.additionalUserInfo!.isNewUser) {
        userModel = UserModel(
          name: userCredential.user!.displayName ?? "No Name",
          uid: userCredential.user!.uid,
          email: userCredential.user!.email,
          profilePic: userCredential.user!.photoURL ?? Constants.avatarDefault,
        );
        await _users.doc(userCredential.user!.uid).set(userModel.toMap());
        print("New user created and saved to Firestore");
      } else {
        userModel = await getUserData(userCredential.user!.uid).first;
        print("Existing user fetched from Firestore");
      }

      return right(userModel);
    } on FirebaseAuthException catch (e) {
      print("FirebaseAuthException: ${e.message}"); // Debugging line
      return left(Failure(e.message ?? "FirebaseAuth error occurred."));
    } catch (e, st) {
      print("Unexpected error: $e"); // Debugging line
      print("Stack trace: $st"); // Debugging line
      return left(Failure(e.toString()));
    }
  }

  Stream<UserModel> getUserData(String uid) {
    return _users.doc(uid).snapshots().map(
          (event) => UserModel.fromMap(event.data() as Map<String, dynamic>),
        );
  }

  void logOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
    print("User logged out successfully"); // Debugging line
  }
}
