import 'package:flutter/material.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes Page"),
      ),
      body: Column(
        children: [
          Image.asset('assets/images/panda.png'),
          const Text("Hey! Hi You are on a Notes Page"),
        ],
      ),
    );
  }
}
