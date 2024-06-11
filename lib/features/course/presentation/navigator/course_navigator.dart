import 'package:student_management_starter/app/navigator/navigator.dart';
import 'package:student_management_starter/features/course/presentation/view/course_view.dart';

class CourseViewNavigator {}

mixin CourseViewRoute {
  openCourseView() {
    NavigateRoute.pushRoute(const CourseView());
  }
}
