import 'package:abyad/controllers/login_controller.dart';
import 'package:abyad/screens/abyad_nav_screen.dart';
import 'package:abyad/utils/assets.dart';
import 'package:abyad/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final InputDecoration _inputDecoration = const InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 1.0,
        color: mainColor,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 1.0,
        color: red,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 1.0,
        color: mainColor,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
    ),
  );
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginController>(
        builder: (context, loginController, child) {
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Image.asset(Assets.imagify("abyad"))),
            const SizedBox(height: 40),
            SizedBox(
              width: 400,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Username',
                      style: TextStyle(
                        color: grey,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _usernameController,
                      decoration: _inputDecoration,
                      keyboardType: TextInputType.text,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a valid username!';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Passowrd',
                      style: TextStyle(
                        color: grey,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _passwordController,
                      decoration: _inputDecoration,
                      obscureText: true,
                      validator: (String? value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 8) {
                          return 'Please enter a valid password!';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 40),
                    InkWell(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          bool response = loginController.login();
                          if (response) {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const AbyadNavScreen(),
                              ),
                            );
                          } else {
                            _passwordController.clear();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: red,
                                content: Center(
                                  child: Text(
                                    "An error occured. Please, try again!",
                                    style: TextStyle(
                                      color: white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        height: 80,
                        width: 400,
                        child: const Center(
                          child: Text(
                            "Login",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: white,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
