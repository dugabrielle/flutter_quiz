import 'package:flutter/material.dart';
import 'package:flutter_quizz/src/data/utils/answer_btn_color.dart';
import 'package:flutter_quizz/src/data/utils/random_border.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int selected = -1;
  final int correct = 2; // exemplo de resposta correta
  bool disabled = false;
  int maxTries = 3;
  int tries = 0;

  final List<String> options = [
    'Alternativa A',
    'Alternativa B',
    'Alternativa C',
    'Alternativa D',
  ];

  void handleTap(int index, BuildContext context) {
    if (disabled) return; // impede selecionar novamente após estar desabilitada
    setState(() {
      selected = index;

      if (index == correct) {
        disabled = true;
      } else {
        tries++;
        if (tries >= maxTries) {
          disabled = true;
        }
      }
    });

    if (index != correct) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Ops, resposta incorreta! Tentativas restantes: ${maxTries - tries}',
          ),
          duration: Duration(seconds: 1),
        ),
      );
    }
  }

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
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                // abrir popup
                                Navigator.pushReplacementNamed(
                                  context,
                                  '/home',
                                );
                              },
                              icon: const Icon(
                                Icons.close,
                                color: Color.fromARGB(255, 204, 204, 204),
                                size: 24,
                              ),
                            ),
                            const Spacer(),
                            const Text(
                              'Pergunta 1/10',
                              style: TextStyle(
                                color: Color.fromARGB(255, 204, 204, 204),
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
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
                            children: List.generate(options.length, (index) {
                              return NeonButton(
                                text: options[index],
                                onTap: () => handleTap(index, context),
                                color: answerBtnColor(
                                  disabled: disabled,
                                  index: index,
                                  selected: selected,
                                  correct: correct,
                                ),
                              );
                            }),
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

class NeonButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color color;

  const NeonButton({
    required this.text,
    required this.onTap,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: BorderColor.value),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: color == Colors.transparent ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
