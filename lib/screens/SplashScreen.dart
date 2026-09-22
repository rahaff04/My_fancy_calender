import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'calendar_page.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  //to navigate from splash to home page
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }
  void _navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 4500));

    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 800),
        pageBuilder: (context, animation, secondaryAnimation) => const CalendarPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // title
            AnimatedTextKit(
              key: UniqueKey(),
              animatedTexts: [
                TypewriterAnimatedText(
                  'Calendar',
                  speed: const Duration(milliseconds: 100),
                  textStyle: GoogleFonts.silkscreen(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFF69B4),
                    shadows: [
                    Shadow(
                    blurRadius: 8.0,
                    color: Color(0xFFFFB6C1),
                    offset: Offset(2, 2),
                  ),],
                    letterSpacing: 2.0,
                  ),
                )
              ],
              isRepeatingAnimation: true,
            ),

            const SizedBox(height: 20),

            // helo gify
            Image.asset(
              'assets/gifs/hello.gif',
              width: 144,
              height: 144,
            ),


            //pixil dots
            const PixiLoad()
          ],
        )
      ),
    );
  }
}



class PixiLoad extends StatefulWidget {
  const PixiLoad({super.key});

  @override
  State<PixiLoad> createState() => _PixiLoadState();
}

class _PixiLoadState extends State<PixiLoad> with SingleTickerProviderStateMixin{

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder:(context, child) {
          int activeIndex = (_controller.value * 3).floor();

          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) {
            bool isActive = index == activeIndex;
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width:  10, height: 10,
              decoration: BoxDecoration(
                color: isActive
                    ? const Color(0xFFFF1493)
                    : const Color(0xFFFFB6C1).withOpacity(0.4),
                  shape: BoxShape.rectangle,
              ),
            );
          }),
          );
        }

    );
  }
}
