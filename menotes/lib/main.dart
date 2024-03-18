import 'package:flutter/material.dart';
import 'package:menotes/constants/routes.dart';
import 'package:menotes/views/login_view.dart';
import 'package:menotes/views/notes_view.dart';
import 'package:menotes/views/register_view.dart';
import 'package:menotes/views/verification_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/login-view/',
      routes: {
        loginRoute: (context) => const LoginView(),
        registerRoute: (context) => const RegisterView(),
        verificationRoute: (context) => const VerificationPage(),
        notesRoute: (context) => const NotesView(),
      },
    );
  }
}
