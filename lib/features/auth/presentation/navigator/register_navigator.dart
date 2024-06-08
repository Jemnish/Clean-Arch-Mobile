import 'package:student_management_starter/app/navigator/navigator.dart';
import 'package:student_management_starter/features/auth/presentation/view/register_view.dart';


// If I want to go somewhere from here I have to use class
class RegisterViewNavigator {}


// Whoever wants to call me has to use mixin
mixin RegisterViewRoute {
  openRegisterView() {
    NavigateRoute.pushRoute(const RegisterView());
  }
}
