import 'package:flutter/material.dart';
import 'package:flutter_quizz/src/data/utils/random_border.dart';

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
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 400),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            'Pergunta 1/10',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              color: const Color.fromARGB(255, 204, 204, 204),
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: BorderColor.value),
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
                          padding: const EdgeInsets.symmetric(horizontal: 0),
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
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
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
  bool? answered; //

  // initState

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          border: Border.all(color: BorderColor.value),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
