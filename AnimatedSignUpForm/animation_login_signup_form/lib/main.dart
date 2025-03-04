import 'package:animation_login_signup_form/homeScreenComponents/lottie_animation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeButtonAnimation(),
    );
  }
}

class HomeButtonAnimation extends StatefulWidget {
  const HomeButtonAnimation({super.key});

  @override
  State<HomeButtonAnimation> createState() => _HomeButtonAnimationState();
}

class _HomeButtonAnimationState extends State<HomeButtonAnimation>
    with TickerProviderStateMixin {
  // Changed from 'with Ticker' to 'with TickerProviderStateMixin'
  // Is Animation Started
  bool isAnim = true;

  // Initialize Main Controller (for container animations)
  late AnimationController _mainController;

  // Initialize Form Controller (for form element animations)
  late AnimationController _formController;

  // Store MediaQuery-dependent value
  late double screenHeight;

  // Animations for main container (non-MediaQuery dependent, initialized in initState)
  late Animation<double> _textFadeAnimation;
  late Animation<double> _buttonWidthAnimation;
  late Animation<double> _containerWidthAnimation;
  late Animation<double> _containerHeightAnimation;

  // MediaQuery-dependent animations (initialize in didChangeDependencies)
  late Animation<double> _emailOpacityAnimation;
  late Animation<double> _emailPositionAnimation;

  // Add new animations
  late Animation<double> _namePositionAnimation;
  late Animation<double> _nameOpacityAnimation;
  late Animation<double> _passwordPositionAnimation;
  late Animation<double> _passwordOpacityAnimation;
  late Animation<double> _signUpButtonPositionAnimation;
  late Animation<double> _signUpButtonOpacityAnimation;
  late Animation<double> _textPositionAnimation;
  late Animation<double> _textOpacityAnimation;
  late Animation<double> _iconsPositionAnimation;
  late Animation<double> _iconsOpacityAnimation;

  // Sign In related controllers and animations
  late AnimationController _signInController;
  late Animation<double> _signInContainerWidthAnimation;
  late Animation<double> _signInContainerHeightAnimation;
  late Animation<double> _signInEmailPositionAnimation;
  late Animation<double> _signInEmailOpacityAnimation;
  late Animation<double> _signInPasswordPositionAnimation;
  late Animation<double> _signInPasswordOpacityAnimation;
  late Animation<double> _signInButtonPositionAnimation;
  late Animation<double> _signInButtonOpacityAnimation;
  late Animation<double> _signInTextPositionAnimation;
  late Animation<double> _signInTextOpacityAnimation;
  late Animation<double> _signInIconsPositionAnimation;
  late Animation<double> _signInIconsOpacityAnimation;

  // Add bounce animation for sign in text
  late AnimationController _bounceController;
  late Animation<double> _bounceAnimation;

  @override
  void initState() {
    super.initState();

    // Main controller for container (faster animation)
    _mainController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    )..addListener(() => setState(() {}));

    // Form controller for email field animation (slower for smooth movement)
    _formController = AnimationController(
      vsync: this,
      duration: const Duration(
          milliseconds: 2000), // Increased duration for all animations
    )..addListener(() => setState(() {}));

    // Initialize non-MediaQuery dependent animations for main container
    _textFadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
          parent: _mainController,
          curve: const Interval(0.0, 0.2, curve: Curves.easeInOut)),
    ); // 0s-0.2s: Fade out text

    _buttonWidthAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
          parent: _mainController,
          curve: const Interval(0.2, 0.4, curve: Curves.easeInOut)),
    ); // 0.2s-0.4s: Shrink button width to 0

    _containerWidthAnimation =
        Tween<double>(begin: 0.0, end: double.infinity).animate(
      CurvedAnimation(
          parent: _mainController,
          curve: const Interval(0.4, 0.6, curve: Curves.easeInOut)),
    ); // 0.4s-0.7s: Expand container width

    _containerHeightAnimation = Tween<double>(begin: 0.0, end: 560).animate(
      CurvedAnimation(
          parent: _mainController,
          curve: const Interval(0.6, 1.0, curve: Curves.easeInOut)),
    ); // 0.7s-1.0s: Increase container height

    // Initialize bounce animation
    _bounceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _bounceAnimation = Tween<double>(
      begin: 1.0,
      end: 0.9,
    ).animate(
      CurvedAnimation(
        parent: _bounceController,
        curve: Curves.easeInOut,
      ),
    );

    // Initialize sign in controller
    _signInController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..addListener(() => setState(() {}));

    // Initialize sign in animations
    _signInContainerWidthAnimation = Tween<double>(
      begin: 0.0,
      end: double.infinity,
    ).animate(
      CurvedAnimation(
        parent: _signInController,
        curve: const Interval(0.0, 0.3, curve: Curves.easeInOut),
      ),
    );

    _signInContainerHeightAnimation = Tween<double>(
      begin: 0.0,
      end: 460.0,
    ).animate(
      CurvedAnimation(
        parent: _signInController,
        curve: const Interval(0.3, 0.6, curve: Curves.easeInOut),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Update email position animation with smooth movement and final bounce
    _emailPositionAnimation = TweenSequence<double>([
      // First 70% of animation: Smooth upward movement
      TweenSequenceItem(
        tween: Tween<double>(begin: 400, end: 20)
            .chain(CurveTween(curve: Curves.easeOut)),
        weight: 70,
      ),
      // Last 30% of animation: Small bounce at final position
      TweenSequenceItem(
        tween: Tween<double>(begin: 20, end: 0)
            .chain(CurveTween(curve: Curves.bounceOut)),
        weight: 30,
      ),
    ]).animate(
      CurvedAnimation(
        parent: _formController,
        curve: const Interval(0.0, 1.0),
      ),
    );

    // Keep opacity animation smooth
    _emailOpacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _formController,
        curve: const Interval(0.2, 0.7, curve: Curves.easeIn),
      ),
    );

    // Email animations (0-20% of total duration)
    _emailPositionAnimation = _createPositionAnimation(0.0, 0.2);
    _emailOpacityAnimation = _createOpacityAnimation(0.0, 0.2);

    // Name field animations (20-40% of total duration)
    _namePositionAnimation = _createPositionAnimation(0.2, 0.4);
    _nameOpacityAnimation = _createOpacityAnimation(0.2, 0.4);

    // Password field animations (40-60% of total duration)
    _passwordPositionAnimation = _createPositionAnimation(0.4, 0.6);
    _passwordOpacityAnimation = _createOpacityAnimation(0.4, 0.6);

    // Sign Up button animations (60-75% of total duration)
    _signUpButtonPositionAnimation = _createPositionAnimation(0.6, 0.75);
    _signUpButtonOpacityAnimation = _createOpacityAnimation(0.6, 0.75);

    // Text animations (75-85% of total duration)
    _textPositionAnimation = _createPositionAnimation(0.75, 0.85);
    _textOpacityAnimation = _createOpacityAnimation(0.75, 0.85);

    // Icons animations (85-100% of total duration)
    _iconsPositionAnimation = _createPositionAnimation(0.85, 1.0);
    _iconsOpacityAnimation = _createOpacityAnimation(0.85, 1.0);

    // Sign In form animations with correct controller
    _signInEmailPositionAnimation = _createSignInPositionAnimation(0.0, 0.25);
    _signInEmailOpacityAnimation = _createSignInOpacityAnimation(0.0, 0.25);

    _signInPasswordPositionAnimation =
        _createSignInPositionAnimation(0.25, 0.50);
    _signInPasswordOpacityAnimation = _createSignInOpacityAnimation(0.25, 0.50);

    _signInButtonPositionAnimation = _createSignInPositionAnimation(0.50, 0.70);
    _signInButtonOpacityAnimation = _createSignInOpacityAnimation(0.50, 0.70);

    _signInTextPositionAnimation = _createSignInPositionAnimation(0.70, 0.85);
    _signInTextOpacityAnimation = _createSignInOpacityAnimation(0.70, 0.85);

    _signInIconsPositionAnimation = _createSignInPositionAnimation(0.85, 1.0);
    _signInIconsOpacityAnimation = _createSignInOpacityAnimation(0.85, 1.0);
  }

  // Helper method to create position animations
  Animation<double> _createPositionAnimation(
      double startInterval, double endInterval) {
    return TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 400, end: 20)
            .chain(CurveTween(curve: Curves.easeOut)),
        weight: 70,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 20, end: 0)
            .chain(CurveTween(curve: Curves.bounceOut)),
        weight: 30,
      ),
    ]).animate(
      CurvedAnimation(
        parent: _formController,
        curve: Interval(startInterval, endInterval),
      ),
    );
  }

  // Helper method to create opacity animations
  Animation<double> _createOpacityAnimation(
      double startInterval, double endInterval) {
    return Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _formController,
        curve: Interval(startInterval, endInterval, curve: Curves.easeIn),
      ),
    );
  }

  // 1. First, separate the sign-in animations to use _signInController instead of _formController
  Animation<double> _createSignInPositionAnimation(
      double startInterval, double endInterval) {
    return TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 400, end: 20)
            .chain(CurveTween(curve: Curves.easeOut)),
        weight: 70,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 20, end: 0)
            .chain(CurveTween(curve: Curves.bounceOut)),
        weight: 30,
      ),
    ]).animate(
      CurvedAnimation(
        parent: _signInController,
        curve: Interval(startInterval, endInterval),
      ),
    );
  }

  Animation<double> _createSignInOpacityAnimation(
      double startInterval, double endInterval) {
    return Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _signInController,
        curve: Interval(startInterval, endInterval, curve: Curves.easeIn),
      ),
    );
  }

  void _clickButtonAnimation() {
    if (_mainController.isCompleted && _formController.isCompleted) {
      _mainController.reverse();
      Future.delayed(const Duration(milliseconds: 200), () {
        _formController.reverse();
      });
      isAnim = true;
    } else {
      _mainController.forward().whenComplete(() {
        // Increased delay to 400ms for more noticeable sequence
        Future.delayed(const Duration(milliseconds: 400), () {
          _formController.forward();
        });
      });
      isAnim = false;
    }
  }

  // Add method to handle sign in transition
  void _handleSignInTransition() async {
    // Play bounce animation
    await _bounceController.forward();
    await _bounceController.reverse();

    // Reverse only form animations, not container
    _formController.reverse();

    // Start sign in animations after form elements disappear
    Future.delayed(const Duration(milliseconds: 400), () {
      _signInController.forward();
    });
  }

  // 1. Add method to handle transition back to Sign Up form
  void _handleSignUpTransition() async {
    // Play bounce animation
    await _bounceController.forward();
    await _bounceController.reverse();

    // Reverse sign in form animations
    _signInController.reverse();

    // Start sign up form animations after a delay
    Future.delayed(const Duration(milliseconds: 400), () {
      _formController.forward();
    });
  }

  @override
  void dispose() {
    _mainController.dispose();
    _formController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LottieAnimation(
              assetPath: 'assets/lottie/getStartedLottie.json',
              height: isAnim ? size.height * 0.35 : size.height * 0.25,
            ),
            SizedBox(height: size.height * 0.08),
            Stack(
              alignment: Alignment.center, // Center the button and container
              children: [
                // Container with form fields, button, text, and icons (animates with second controller)
                AnimatedBuilder(
                  animation: _formController,
                  builder: (context, child) {
                    return Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFD640),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      width: _containerWidthAnimation.value,
                      height: _containerHeightAnimation.value,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: size.height * 0.05),
                          Transform.translate(
                            offset: Offset(0, -_emailPositionAnimation.value),
                            child: Opacity(
                              opacity: _emailOpacityAnimation.value,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 8,
                                        offset: const Offset(2, 4),
                                      ),
                                    ],
                                  ),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: "Enter Email",
                                      suffixIcon:
                                          const Icon(Icons.email_outlined),
                                      labelStyle: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey[700]),
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 16, horizontal: 20),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide.none,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide.none,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: const BorderSide(
                                            color: Color(0xFFFFD740), width: 2),
                                      ),
                                    ),
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(0, _namePositionAnimation.value),
                            child: Opacity(
                              opacity: _nameOpacityAnimation.value,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 8,
                                        offset: const Offset(2, 4),
                                      ),
                                    ],
                                  ),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: "Enter Your Name",
                                      suffixIcon:
                                          const Icon(Icons.person_outline),
                                      labelStyle: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey[700]),
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 16, horizontal: 20),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide.none,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide.none,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: const BorderSide(
                                            color: Color(0xFFFFD740), width: 2),
                                      ),
                                    ),
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(0, _passwordPositionAnimation.value),
                            child: Opacity(
                              opacity: _passwordOpacityAnimation.value,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 8,
                                        offset: const Offset(2, 4),
                                      ),
                                    ],
                                  ),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: "Enter Password",
                                      suffixIcon: const Icon(Icons.password),
                                      labelStyle: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey[700]),
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 16, horizontal: 20),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide.none,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide.none,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: const BorderSide(
                                            color: Color(0xFFFFD740), width: 2),
                                      ),
                                    ),
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: size.height * 0.02),
                          Transform.translate(
                            offset:
                                Offset(0, _signUpButtonPositionAnimation.value),
                            child: Opacity(
                              opacity: _signUpButtonOpacityAnimation.value,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  minimumSize: Size(
                                      size.width * 0.95, size.height * 0.07),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    fontSize: size.width * 0.048,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          _buildAnimatedText(
                            position: _textPositionAnimation,
                            opacity: _textOpacityAnimation,
                            text: "Already have an account? Sign In",
                            isSignIn:
                                false, // This is optional as it's the default
                          ),
                          Transform.translate(
                            offset: Offset(0, _iconsPositionAnimation.value),
                            child: Opacity(
                              opacity: _iconsOpacityAnimation.value,
                              child: const Padding(
                                padding: EdgeInsets.only(top: 40),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.black,
                                      radius: 24,
                                      child: Icon(Icons.g_mobiledata,
                                          color: Colors.white),
                                    ),
                                    SizedBox(width: 18),
                                    CircleAvatar(
                                      backgroundColor: Colors.black,
                                      radius: 24,
                                      child: Icon(Icons.apple,
                                          color: Colors.white),
                                    ),
                                    SizedBox(width: 18),
                                    CircleAvatar(
                                      backgroundColor: Colors.black,
                                      radius: 24,
                                      child: Icon(Icons.facebook,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),

                // ElevatedButton with "Get Started" (fades out first, then shrinks)
                AnimatedBuilder(
                  animation: _mainController,
                  builder: (context, child) {
                    return ScaleTransition(
                      scale: _buttonWidthAnimation, // Use for width scaling
                      child: ElevatedButton(
                        onPressed: _clickButtonAnimation,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFFD640),
                          minimumSize: Size(
                              size.width * 0.9 * _buttonWidthAnimation.value,
                              size.height * 0.07), // Scale width
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Opacity(
                          opacity: _textFadeAnimation.value,
                          child: Text(
                            "Get Started",
                            style: TextStyle(
                              fontSize: size.width * 0.05,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),

                // Add this as a sibling to your existing Stack children
                AnimatedBuilder(
                  animation: _signInController,
                  builder: (context, child) {
                    return Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFD640),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      width: _signInContainerWidthAnimation.value,
                      height: _signInContainerHeightAnimation.value,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: size.height * 0.05),
                          // Email field
                          _buildAnimatedFormField(
                            position: _signInEmailPositionAnimation,
                            opacity: _signInEmailOpacityAnimation,
                            label: "Enter Email",
                            icon: Icons.email_outlined,
                          ),
                          // Password field
                          _buildAnimatedFormField(
                            position: _signInPasswordPositionAnimation,
                            opacity: _signInPasswordOpacityAnimation,
                            label: "Enter Password",
                            icon: Icons.lock_outline,
                          ),
                          // Sign In button
                          _buildAnimatedButton(
                            position: _signInButtonPositionAnimation,
                            opacity: _signInButtonOpacityAnimation,
                            label: "Sign In",
                          ),
                          // Create Account text
                          _buildAnimatedText(
                            position: _signInTextPositionAnimation,
                            opacity: _signInTextOpacityAnimation,
                            text: "Don't have an account? Create One",
                            isSignIn: true, // Add this parameter
                          ),
                          // Social icons
                          _buildAnimatedSocialIcons(
                            position: _signInIconsPositionAnimation,
                            opacity: _signInIconsOpacityAnimation,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedButton({
    required Animation<double> position,
    required Animation<double> opacity,
    required String label,
  }) {
    return Transform.translate(
      offset: Offset(0, position.value),
      child: Opacity(
        opacity: opacity.value,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            minimumSize: Size(MediaQuery.of(context).size.width * 0.95,
                MediaQuery.of(context).size.height * 0.07),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.048,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  // 2. Update the _buildAnimatedText method to handle both transitions
  Widget _buildAnimatedText({
    required Animation<double> position,
    required Animation<double> opacity,
    required String text,
    bool isSignIn = false, // Add parameter to determine which form we're in
  }) {
    return Transform.translate(
      offset: Offset(0, position.value),
      child: Opacity(
        opacity: opacity.value,
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 150.0),
          child: GestureDetector(
            onTap: isSignIn ? _handleSignUpTransition : _handleSignInTransition,
            child: RichText(
              text: TextSpan(
                text: isSignIn
                    ? "Don't have an account? "
                    : "Already have an account? ",
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: isSignIn ? "Create One" : "Sign In",
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedSocialIcons({
    required Animation<double> position,
    required Animation<double> opacity,
  }) {
    return Transform.translate(
      offset: Offset(0, position.value),
      child: Opacity(
        opacity: opacity.value,
        child: Padding(
          padding: EdgeInsets.only(top: 40),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.black,
                radius: 24,
                child: Icon(Icons.g_mobiledata, color: Colors.white),
              ),
              SizedBox(width: 18),
              CircleAvatar(
                backgroundColor: Colors.black,
                radius: 24,
                child: Icon(Icons.apple, color: Colors.white),
              ),
              SizedBox(width: 18),
              CircleAvatar(
                backgroundColor: Colors.black,
                radius: 24,
                child: Icon(Icons.facebook, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Update the _buildAnimatedFormField method with complete decoration
  Widget _buildAnimatedFormField({
    required Animation<double> position,
    required Animation<double> opacity,
    required String label,
    required IconData icon,
  }) {
    return Transform.translate(
      offset: Offset(0, position.value),
      child: Opacity(
        opacity: opacity.value,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(2, 4),
                ),
              ],
            ),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: label,
                suffixIcon: Icon(icon),
                labelStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[700],
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 20,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Color(0xFFFFD740),
                    width: 2,
                  ),
                ),
              ),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
