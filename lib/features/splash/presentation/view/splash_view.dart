import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/features/splash/presentation/viewmodel/splash_view_model.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<SplashView> createState() => _SplashViewState();
}

//  Make the splash screen consumer stateless to use initState
class _SplashViewState extends ConsumerState<SplashView> {
  @override
  void initState() {
    // Wait for 2 seconds and then navigate
    // Future.delayed(const Duration(seconds: 2), () {
    //   Navigator.of(context).pushReplacement(MaterialPageRoute(
    //     builder: (context) => const LoginView(),
    //   ));
    // });
    // Calling login view
    ref.read(splashViewModelProvider.notifier).openLoginView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.asset('assets/images/splash.png'),
                ),
                const Text(
                  'Student Course Management',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 10),
                const CircularProgressIndicator(),
                const SizedBox(height: 10),
                const Text('version : 1.0.0')
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            left: MediaQuery.of(context).size.width / 4,
            child: const Text(
              'Developed by: Khatra Sir le',
              style: TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
