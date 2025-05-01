import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todyapp/core/utils.dart';
import 'package:todyapp/featurs/auth/repository/auth_repository.dart';
import 'package:todyapp/featurs/home/bottom/naviagtion_bar_page.dart';
import 'package:todyapp/featurs/home/screens/home_page.dart';
import 'package:todyapp/models/usermodel.dart';

final userProvider = StateProvider<UserModel?>(
  (ref) => null,
);

final authControllerProvider = StateNotifierProvider<AuthController, bool>(
  (ref) => AuthController(
    authRepository: ref.watch(authRepositoryProvider),
    ref: ref,
  ),
);

final authStateChangeProvider = StreamProvider((ref) {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.authStateChange;
});

final getUserDataProvider = StreamProvider.family((ref, String uid) {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.getUserData(uid);
});

class AuthController extends StateNotifier<bool> {
  final AuthRepository _authRepository;
  final Ref _ref;
  AuthController({required AuthRepository authRepository, required Ref ref})
      : _authRepository = authRepository,
        _ref = ref,
        super(false); //loading

  Stream<User?> get authStateChange => _authRepository.authStateChange;
  Future<bool> signInWithGoogle(BuildContext context, bool isFromLogin) async {
    state = true;

    final userResult = await _authRepository.signInWithGoogle(isFromLogin);
    state = false;

    if (!context.mounted) return false;

    return userResult.fold(
      (failure) {
        showSnackBar(context, failure.message);
        return false;
      },
      (userModel) {
        _ref.read(userProvider.notifier).update((state) => userModel);

        return true;
      },
    );
  }

  Stream<UserModel> getUserData(String uid) {
    return _authRepository.getUserData(uid);
  }

  Future<void> logOut() async {
    return _authRepository.logOut();
  }
}
