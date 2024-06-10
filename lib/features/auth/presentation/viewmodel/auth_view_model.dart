import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/features/auth/presentation/navigator/login_navigator.dart';

final loginViewModelProvider = StateNotifierProvider<AuthViewModel, void>(
  (ref) => AuthViewModel(ref.read(loginViewNavigatorProvider)),
);

class AuthViewModel extends StateNotifier<void> {
  AuthViewModel(this.navigator) : super(null);

  final LoginViewNavigator navigator;

  void openRegisterView() {
    navigator.openRegisterView();
  }

  void openHomeView() {
    navigator.openHomeView();
  }
}
