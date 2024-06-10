import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/features/splash/presentation/navigator/splash_navigator.dart';

final splashViewModelProvider =
    StateNotifierProvider<SplashViewModel, void>((ref) {
  final navigator = ref.read(splashViewNavigatorProvider);
  return SplashViewModel(navigator);
});

class SplashViewModel extends StateNotifier<void> {
  SplashViewModel(this.navigator) : super(null);

  final SplashViewNavigator navigator;

  // Open Login page
  void openLoginView() {
    Future.delayed(const Duration(seconds: 1), () {
      navigator.openLoginView();
    });
  }

  // Later on we will add open home page method here as well
  void openHomeView() {
    // Your code goes here
  }
}
