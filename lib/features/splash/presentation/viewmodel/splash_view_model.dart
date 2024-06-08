import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/features/splash/presentation/navigator/splash_navigator.dart';
// Always start navigation from view model screen



final splashViewModelProvider =
    StateNotifierProvider<SplashViewModel, void>((ref) {
  final navigator = ref.read(splashViewNavigatorProvider);
  return SplashViewModel(navigator);
});

// Used void because ther is no state
class SplashViewModel extends StateNotifier<void> {
  SplashViewModel(this.navigator) : super(null);

  final SplashViewNavigator navigator;

  // Open Login
  void openLoginView() {
    Future.delayed(const Duration(seconds: 1), () {
      navigator.openLoginView();
    });
  }

  // Later homepage method will be used
  void openHomeView() {}
}
