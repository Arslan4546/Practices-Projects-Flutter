import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Puzzle Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(), // Start with SplashScreen
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _scaleController;
  late AnimationController _textMoveController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _textOffsetAnimation;

  @override
  void initState() {
    super.initState();

    // Fade Animation Controller for logo
    _fadeController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _fadeAnimation = Tween(begin: 0.0, end:2.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeIn),
    );

    // Scale Animation Controller for logo
    _scaleController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _scaleAnimation = Tween(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.elasticOut),
    );

    // Text Animation Controller to move text upwards
    _textMoveController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Adjusted offset to move text from the bottom to the center of the screen
    _textOffsetAnimation = Tween<Offset>(
      begin: const Offset(0, 5), // Starts from below the screen
      end: const Offset(0, -2), // Ends closer to the center
    ).animate(
      CurvedAnimation(parent: _textMoveController, curve: Curves.easeInOut),
    );

    // Start the initial animations for the logo and text
    _fadeController.forward();
    _scaleController.forward();

    // Delay and then start the text movement animation
    Future.delayed(const Duration(seconds: 2), () {
      _textMoveController.forward();
    });

    // Navigate to Main Page after animation completes
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MyHomePage(title: "Puzzle Game")),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Full-Screen Background Color
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Blue Background
          Container(
            color: Colors.white, // Solid blue background
          ),

          // Centered logo with fade and scale animations
          Center(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: Image.asset(
                  'assets/Images/center4.png', // Logo image
                  width: 300,  // Adjust size of logo
                  height: 300,
                ),
              ),
            ),
          ),

          // Text below the logo with slide-up animation
          Positioned(
            bottom: 150, // Initial position below the logo
            left: 0,
            right: 0,
            child: SlideTransition(
              position: _textOffsetAnimation,
              child:  Text(
                "Welcome To Puzzle Game",
                textAlign: TextAlign.center,
                style: GoogleFonts.lovedByTheKing(
                  textStyle:const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black,
                      offset: Offset(4.0, 4.0),
                    ),
                  ],
                ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _scaleController.dispose();
    _textMoveController.dispose();
    super.dispose();
  }
}
