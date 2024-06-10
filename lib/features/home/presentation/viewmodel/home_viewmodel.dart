import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/core/common/my_snackbar.dart';
import 'package:student_management_starter/features/home/presentation/navigator/home_navigator.dart';

final homeViewModelProvider = StateNotifierProvider<HomeViewModel, bool>(
  (ref) => HomeViewModel(ref.read(homeViewNavigatorProvider)),
);

class HomeViewModel extends StateNotifier<bool> {
  HomeViewModel(this.homeNavigator) : super(false);
  final HomeViewNavigator homeNavigator;

  void logout() async {
    showMySnackBar(message: 'Logging out....', color: Colors.red);
    await Future.delayed(const Duration(seconds: 1));
    openLoginView();
  }

  openLoginView() {
    homeNavigator.openLoginView();
  }
}
