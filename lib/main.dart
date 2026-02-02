import 'package:flutter/material.dart';
import 'package:flutter_quizz/src/data/providers/quiz_provider.dart';
import 'package:flutter_quizz/src/ui/pages/boas_vindas.dart';
import 'package:flutter_quizz/src/ui/pages/home.dart';
import 'package:flutter_quizz/src/ui/pages/perfil.dart';
import 'package:flutter_quizz/src/ui/pages/quizpage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (_) => QuizProvider(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Doit',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/home',
      routes: {
        '/boasVindas': (context) => const BoasVindas(),
        '/home': (context) => const HomePage(),
        '/perfil': (context) => const PerfildoUsuario(),
        '/quiz': (context) => const QuizPage(),
      },
    );
  }
}
