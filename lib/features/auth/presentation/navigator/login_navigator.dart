import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/app/navigator/navigator.dart';
import 'package:student_management_starter/features/auth/presentation/navigator/register_navigator.dart';
import 'package:student_management_starter/features/auth/presentation/view/login_view.dart';
import 'package:student_management_starter/features/batch/presentation/navigator/batch_navigator.dart';
import 'package:student_management_starter/features/course/presentation/navigator/course_navigator.dart';
import 'package:student_management_starter/features/home/presentation/navigator/home_navigator.dart';

final loginViewNavigatorProvider = Provider((ref) => LoginViewNavigator());

// This class will be used to call register view
class LoginViewNavigator
    with RegisterViewRoute, HomeViewRoute, BatchViewRoute, CourseViewRoute {}

// Anyone who want to call login page
mixin LoginViewRoute {
  openLoginView() {
    NavigateRoute.popAndPushRoute(const LoginView());
  }
}
