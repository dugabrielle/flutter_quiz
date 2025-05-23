import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: const Center(child: Text('Quiz de Alemão')),
    );
  }
}

// MyAppBar

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Quiz Doit'),
      centerTitle: true,
      backgroundColor: const Color.fromARGB(255, 91, 147, 211),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
