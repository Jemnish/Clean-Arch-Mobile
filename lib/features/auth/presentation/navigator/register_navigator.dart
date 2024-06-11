import 'package:student_management_starter/app/navigator/navigator.dart';
import 'package:student_management_starter/features/auth/presentation/view/register_view.dart';

// This class will call any view I call
class RegisterViewNavigator {}

// Anyone who want to call register view
mixin RegisterViewRoute {
  openRegisterView() {
    NavigateRoute.pushRoute(const RegisterView());
  }
}
