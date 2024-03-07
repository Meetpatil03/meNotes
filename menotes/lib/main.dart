import 'package:flutter/material.dart';
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
      initialRoute: '/login-view/',
      routes: {
        '/login-view/':(context) => const LoginView(),
        '/register-view/':(context) => const RegisterView(),
        '/verification-page/':(context) => const VerificationPage(),
        '/notes-view/':(context) => const NotesView(), 
      },
    );
  }
}
