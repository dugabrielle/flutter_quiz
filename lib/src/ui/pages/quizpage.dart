import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 24, 24, 24),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Pergunta 1/10',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 204, 204, 204),
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: 300,
                  height: 200,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 51, 51, 51),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      'A imagem vai aqui',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      NeonButton(
                        text: 'Alternativa A',
                        onTap: () {},
                        isCorrect: false,
                      ),
                      NeonButton(
                        text: 'Alternativa B',
                        onTap: () {},
                        isCorrect: false,
                      ),
                      NeonButton(
                        text: 'Alternativa C',
                        onTap: () {},
                        isCorrect: false,
                      ),
                      NeonButton(
                        text: 'Alternativa D',
                        onTap: () {},
                        isCorrect: false,
                      ),
                    ],
                    // elevatedbutton enviar
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NeonButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  final bool isCorrect;

  const NeonButton({
    required this.text,
    required this.onTap,
    required this.isCorrect,
    super.key,
  });

  @override
  State<NeonButton> createState() => _NeonButtonState();
}

class _NeonButtonState extends State<NeonButton> {
  late Color borderColor;

  bool? answered; //

  // initState

  final List<Color> neonColors = [
    Color(0xFF003FFF),
    Color(0xFF9900FF),
    Color(0xFFFF004D),
    Color(0xFF00FF9D),
  ];

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
