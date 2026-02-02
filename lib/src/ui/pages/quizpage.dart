import 'package:flutter/material.dart';
import 'package:flutter_quizz/src/data/providers/quiz_provider.dart';
import 'package:flutter_quizz/src/data/utils/answer_btn_color.dart';
import 'package:flutter_quizz/src/data/utils/random_border.dart';
import 'package:provider/provider.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late Color borderColor;

  @override
  void initState() {
    super.initState();
    BorderColor.value = BorderColor.randomColor;
    borderColor = BorderColor.value;
  }

  void handleTap(int index, BuildContext context) {
    final quiz = context.read<QuizProvider>();
    if (quiz.disabled) return;

    quiz.selectOption(index);

    if (index != quiz.correctIndex) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Ops, resposta incorreta! Tentativas restantes: ${quiz.maxTries - quiz.tries}',
          ),
          duration: const Duration(seconds: 1),
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
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Consumer<QuizProvider>(
                      builder: (context, quiz, child) {
                        if (quiz.subcategories.isEmpty) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        final question = quiz.currentQuestion;

                        if (question == null) {
                          return const Center(
                            child: Text(
                              "Fim do Quiz",
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        }

                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () async {
                                    final bool? fecharQuiz = await showDialog(
                                      context: context,
                                      builder:
                                          (contextDialogo) => AlertDialog(
                                            title: const Text("Sair do quiz?"),
                                            // content: const Text(
                                            //   "Seu progresso não será salvo.",
                                            // ),
                                            actions: [
                                              TextButton(
                                                onPressed:
                                                    () => Navigator.pop(
                                                      contextDialogo,
                                                      false,
                                                    ),
                                                child: const Text("Cancelar"),
                                              ),
                                              TextButton(
                                                onPressed:
                                                    () => Navigator.pop(
                                                      contextDialogo,
                                                      true,
                                                    ),
                                                child: const Text("Sair"),
                                              ),
                                            ],
                                          ),
                                    );

                                    if (!context.mounted) return;
                                    if (fecharQuiz == true) {
                                      Navigator.pushReplacementNamed(
                                        context,
                                        '/home',
                                      );
                                    }
                                  },
                                  icon: const Icon(
                                    Icons.close,
                                    color: Colors.white70,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  "Pergunta ${quiz.questionIndex + 1}/${quiz.subcategories[quiz.subcategoryIndex].questions.length}",
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            // Container da Imagem
                            Container(
                              height: 200,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: BorderColor.value),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image(
                                  image: AssetImage(
                                    'assets/${question.image.replaceAll('assets/', '')}${question.image.contains('.') ? '' : '.png'}',
                                  ),
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image(
                                      image: AssetImage(
                                        'assets/${question.image.replaceAll('assets/', '')}${question.image.contains('.') ? '' : '.jpg'}',
                                      ),
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (c, e, s) => const Center(
                                            child: Icon(
                                              Icons.broken_image,
                                              color: Colors.white,
                                              size: 40,
                                            ),
                                          ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            // Lista de Opções
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: List.generate(question.options.length, (
                                index,
                              ) {
                                final optionText = question.options[index];
                                return NeonButton(
                                  text: optionText,
                                  onTap: () => handleTap(index, context),
                                  color: answerBtnColor(
                                    disabled: quiz.disabled,
                                    index: index,
                                    selected: quiz.selected,
                                    correct: quiz.correctIndex,
                                  ),
                                );
                              }),
                            ),
                            const SizedBox(height: 16),
                            // Botões de Navegação (Back e Next)
                            Row(
                              children: [
                                IconButton(
                                  onPressed:
                                      quiz.questionIndex > 0
                                          ? () => quiz.previousQuestion()
                                          : null,
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color:
                                        quiz.questionIndex > 0
                                            ? Colors.white70
                                            : Colors.white10,
                                  ),
                                ),
                                const Spacer(),
                                IconButton(
                                  onPressed:
                                      quiz.disabled
                                          ? () => quiz.nextQuestion()
                                          : null,
                                  icon: Icon(
                                    Icons.arrow_forward,
                                    color:
                                        quiz.disabled
                                            ? Colors.white70
                                            : Colors.white10,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
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
