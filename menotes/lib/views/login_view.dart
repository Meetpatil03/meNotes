import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:menotes/constants/routes.dart';

import 'package:menotes/utilities/custom_textfield.dart';
import 'package:menotes/utilities/show_errordialog.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with TickerProviderStateMixin {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.04,
              ),
              Row(
                children: [
                  Container(
                      width: 250,
                      height: 250,
                      child: Image.asset('assets/images/login.png')),
                  // const CustomFont(title: 'Login', titleColor: Colors.orange),
                ],
              ),
              SizedBox(
                height: size.height * 0.08,
              ),
              CustomTextField(
                  labelText: 'Email-Id', controller: emailController),
              SizedBox(
                height: size.height * 0.04,
              ),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Enter-Password',
                  labelStyle: const TextStyle(
                    fontSize: 24,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.orange),
                  ),
                  focusColor: Colors.blue,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.grey)),
                  contentPadding: const EdgeInsets.all(12),
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              TextButton(
                onPressed: () async {
                  try {
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text);

                    final user = FirebaseAuth.instance.currentUser!;

                    if (!user.emailVerified) {
                      await _dialogBuilder(context, 'Need-Email-Verification',
                          'Hey! your Credentials are right but you need to verify your Email once');
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          verificationRoute, (route) => false);
                    } else if (user.emailVerified) {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          notesRoute, (route) => false);
                    }
                  } on FirebaseAuthException catch (error) {
                    if ("invalid-credential" == error.code) {
                      await dialogBuilder(context, 'invalid Credentials');
                    } else {
                      await dialogBuilder(context, 'Error: ${error.code}');
                    }
                  } catch (_) {
                    await dialogBuilder(context, _.toString());
                  }
                },
                child: const Text(
                  "Login",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(registerRoute, (route) => false);
                },
                child: const Text(
                  "Register for New_User",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> _dialogBuilder(
    BuildContext context, String title, String content) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Ok"),
            ),
          ],
        );
      });
}
