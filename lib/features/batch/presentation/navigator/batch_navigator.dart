import 'package:student_management_starter/app/navigator/navigator.dart';
import 'package:student_management_starter/features/batch/presentation/view/batch_view.dart';

class BatchViewNavigator {}

mixin BatchViewRoute {
  openBatchView() {
    NavigateRoute.pushRoute(const BatchView());
  }
}
