import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

Future<void> sendEmailVerification() async {
  final user = FirebaseAuth.instance.currentUser;

  if (!user!.emailVerified) {
    await user.sendEmailVerification();
  }
}

class _VerificationPageState extends State<VerificationPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: const Text("Email Verification"),
          centerTitle: true,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Image.asset(
                  'assets/images/hi.png',
                  height: 350,
                  width: 350,
                ),

                SizedBox(
                  height: size.height * 0.05,
                ),
                const Text(
                  " Verify your Email Register....! - Check your Email Inbox to verify your Account",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                // ElevatedButton(
                //   onPressed: () {},
                //   child: const Text(
                //     "verify-Email",
                //     style: TextStyle(fontSize: 18),
                //   ),
                // ),
                SizedBox(
                  height: size.height * 0.08,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/login-view/', (route) => false);
                  },
                  child: const Text(
                    "Restart-Application",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

// Future<void> _dialogBuilder(
//   BuildContext context,
// ) {
//   return showDialog(context: context, builder: (context) {
//     return Alert
//   });
// }
