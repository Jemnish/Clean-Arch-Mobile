import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/app/navigator/navigator.dart';
import 'package:student_management_starter/features/batch/presentation/view/batch_view.dart';

final loginViewNavigatorProvider = Provider((ref) => BatchViewNavigator());

class BatchViewNavigator {}

mixin BatchViewRoute {
  openBatchView() {
    NavigateRoute.popAndPushRoute(const BatchView());
  }
}


