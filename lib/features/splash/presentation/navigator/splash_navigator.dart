import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/features/auth/presentation/navigator/login_navigator.dart';

final splashViewNavigatorProvider =
    Provider<SplashViewNavigator>((ref) => SplashViewNavigator());

// This will be used to view login view
class SplashViewNavigator with LoginViewRoute {}

// No one will call this route
mixin SplashViewRoute {}
