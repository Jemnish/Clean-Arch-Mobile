// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/features/auth/presentation/viewmodel/auth_view_model.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController(text: '');
  final _passwordController = TextEditingController(text: '');

  // final _usernameController = TextEditingController();
  // final _passwordController = TextEditingController();
  final _gap = const SizedBox(height: 8);
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authViewModelProvider);
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Brand Bold',
                      ),
                    ),
                    _gap,
                    TextFormField(
                      key: const ValueKey('username'),
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter username';
                        }
                        return null;
                      },
                    ),
                    _gap,
                    TextFormField(
                      key: const ValueKey('password'),
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        suffixIcon: IconButton(
                            icon: const Icon(Icons.password), onPressed: () {}),
                      ),
                      validator: ((value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      }),
                    ),
                    _gap,
                    ElevatedButton(
                      onPressed: () {
                        {
                          if (_formKey.currentState!.validate()) {
                            ref.read(authViewModelProvider.notifier).login(
                                  username: _usernameController.text,
                                  password: _passwordController.text,
                                );
                          }
                        }
                      },
                      child: const SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Brand Bold',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      key: const ValueKey('registerButton'),
                      onPressed: () {
                        // Navigator.of(context).pushReplacement(MaterialPageRoute(
                        //   builder: (context) => const RegisterView(),
                        // ));

                        ref
                            .read(authViewModelProvider.notifier)
                            .openRegisterView();
                      },
                      child: const SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            'Register',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Brand Bold',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    if (authState.isLoading) const CircularProgressIndicator(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
