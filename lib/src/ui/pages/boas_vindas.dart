import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_quizz/src/ui/medias/screens_width.dart';

class BoasVindas extends StatefulWidget {
  const BoasVindas({super.key});

  @override
  State<BoasVindas> createState() => _BoasVindasState();
}

class _BoasVindasState extends State<BoasVindas> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 228, 227, 227),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 13, 71, 161),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(70),
                        bottomRight: Radius.circular(70),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(50),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/logo_app.png',
                        width:
                            (ScreensWidth.isDesktop(context) ||
                                    ScreensWidth.isLargeDesktop(context))
                                ? MediaQuery.sizeOf(context).width * 0.25
                                : (ScreensWidth.isTablet(context))
                                ? MediaQuery.sizeOf(context).width * 0.4
                                : MediaQuery.sizeOf(context).width * 0.5,
                        fit: BoxFit.cover,
                      ),
                      Shimmer.fromColors(
                        baseColor: const Color.fromARGB(255, 122, 13, 13),
                        highlightColor: Colors.yellow[700]!,
                        child: Text(
                          'Vamos Jogar!',
                          style: GoogleFonts.cabinSketch(
                            textStyle: const TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      MouseRegion(
                        onEnter: (event) {
                          setState(() {
                            isHover = true;
                          });
                        },
                        onExit: (event) {
                          setState(() {
                            isHover = false;
                          });
                        },
                        child: Transform.scale(
                          scale: isHover ? 1.10 : 1.0,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all<Color>(
                                Colors.black,
                              ),
                              padding: WidgetStateProperty.all<EdgeInsets>(
                                EdgeInsets.symmetric(
                                  horizontal: 40,
                                  vertical: 15,
                                ),
                              ),
                              shape: WidgetStateProperty.all<
                                RoundedRectangleBorder
                              >(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, '/home');
                            },
                            child: const Text(
                              'Iniciar',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
