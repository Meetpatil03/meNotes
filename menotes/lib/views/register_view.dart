import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:menotes/constants/routes.dart';

import 'package:menotes/utilities/custom_textfield.dart';
import 'package:menotes/utilities/show_errordialog.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController p1Controller = TextEditingController();
  TextEditingController p2Controller = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    p1Controller.dispose();
    p2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Image.asset(
              'assets/images/register.png',
              height: 340,
              width: 340,
            ),
            CustomTextField(
              controller: emailController,
              labelText: 'Create a Email-Address',
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            TextFormField(
              controller: p1Controller,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Create-Password',
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
              height: size.height * 0.03,
            ),
            TextFormField(
              controller: p2Controller,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'ReEnter-Password',
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
              height: size.height * 0.03,
            ),
            TextButton(
              onPressed: () async {
                if (p1Controller.text != p2Controller.text) {
                  await _dialogBuilder(context);
                }

                if (p1Controller.text == p2Controller.text &&
                    emailController.text.isNotEmpty) {
                  try {
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: emailController.text,
                        password: p1Controller.text);

                    Navigator.of(context).pushNamedAndRemoveUntil(
                        verificationRoute, (route) => false);
                  } on FirebaseException catch (e) {
                    if ('email-Already-in-use' == e.code) {
                      await dialogBuilder(context, 'Email Already in Use');
                    } else if ('weak-password' == e.code) {
                      await dialogBuilder(context, 'Weak Password');
                    } else if ('invalid-email' == e.code) {
                      await dialogBuilder(context, 'Invalid Email');
                    } else {
                      await dialogBuilder(context, 'Error: ${e.code}');
                    }
                  } catch (_) {
                    await dialogBuilder(context, _.toString());
                  }
                }
              },
              child: const Text(
                "Register-My-Account",
                style: TextStyle(fontSize: 18),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(loginRoute, (route) => false);
              },
              child: const Text(
                "Already-have-Account/Login",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _dialogBuilder(BuildContext context) {
  return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Password Didn't Match"),
          content: const Text(
              "You Entered the Password which didn't Match,Please Re-Enter your Matching password"),
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
