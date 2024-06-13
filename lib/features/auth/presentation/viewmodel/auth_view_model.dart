import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/features/auth/domain/entity/auth_entity.dart';
import 'package:student_management_starter/features/auth/domain/usecases/auth_usecase.dart';
import 'package:student_management_starter/features/auth/presentation/navigator/login_navigator.dart';
import 'package:student_management_starter/features/auth/presentation/state/auth_state.dart';
import 'package:student_management_starter/features/batch/presentation/widgets/show_my_snackbar.dart';

final authViewModelProvider =
    StateNotifierProvider<AuthViewModel, AuthState>((ref) {
  final navigator = ref.read(loginViewNavigatorProvider);
  return AuthViewModel(ref.read(authUseCaseProvider), navigator);
});

class AuthViewModel extends StateNotifier<AuthState> {
  AuthViewModel(this._authUseCase, this.navigator) : super(AuthState.initial());

  final AuthUseCase _authUseCase;
  final LoginViewNavigator navigator;

  void addStudent({required AuthEntity auth}) async {
    state = state.copyWith(isLoading: true);
    var data = await _authUseCase.addStudent(auth);
    data.fold((l) {
      state = state.copyWith(isLoading: false, error: l.error);
      showMySnackBar(message: l.error, color: Colors.red);
    }, (r) {
      state = state.copyWith(isLoading: false, error: null);
      showMySnackBar(message: 'Student Added Successfully');
    });
  }

  void login({required String username, required String password}) async {
    state = state.copyWith(isLoading: true);
    var data = await _authUseCase.login(username, password);
    data.fold((l) {
      state = state.copyWith(isLoading: false, error: l.error);
      showMySnackBar(message: "Invalid Credentials", color: Colors.red);
    }, (r) {
      state = state.copyWith(isLoading: false, error: null);
      showMySnackBar(message: 'Login Successful');
      navigator.openHomeView();
    });
  }

  Future<void> uploadProfilePicture(File? file) async {
    state = state.copyWith(isLoading: true);
    var data = await _authUseCase.uploadProfilePicture(file!);
    data.fold((l) {
      state = state.copyWith(isLoading: false, error: l.error);
      showMySnackBar(message: l.error, color: Colors.red);
    }, (r) {
      state = state.copyWith(isLoading: false, error: null);
      showMySnackBar(message: 'Profile Picture Uploaded Successfully');
    });
  }

  void openRegisterView() {
    navigator.openRegisterView();
  }
}
