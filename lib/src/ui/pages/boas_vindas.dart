import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_quizz/src/data/medias/screens_width.dart';

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
      backgroundColor: const Color.fromARGB(255, 215, 230, 240),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 100,
                  horizontal: 60,
                ),
                decoration: BoxDecoration(
                  color: Color(0x66FFFFFF),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/logo_app.png',
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
                      baseColor: Colors.red[900]!,
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
                            shape:
                                WidgetStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Iniciar',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
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
        ),
      ),
    );
  }
}
