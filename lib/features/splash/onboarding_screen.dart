import 'package:appgiftora/core/app_colors.dart';
import 'package:appgiftora/features/auth/signin.dart';
import 'package:appgiftora/features/home/landing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  static const String title = 'Discover the art of gifting with us!';
  static const String description =
      'Don\'t just give a gift, make a lasting impression';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = (constraints.maxWidth - 48).clamp(280.0, 430.0);
            final height = (constraints.maxHeight - 20).clamp(420.0, 900.0);

            return Center(
              child: SizedBox(
                width: width,
                height: height,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(34),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF9F6),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(
                            0xFF54382D,
                          ).withValues(alpha: 0.20),
                          blurRadius: 24,
                          offset: const Offset(0, 12),
                        ),
                      ],
                    ),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(
                          'assets/images/bg.jpg',
                          fit: BoxFit.cover,
                          alignment: const Alignment(0, -1.55),
                          errorBuilder: (context, error, stackTrace) =>
                              Container(color: AppColors.sandal),
                        ),
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          height: 95,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [AppColors.black, Colors.transparent],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          height: height * 0.53,
                          child: ClipPath(
                            clipper: _BottomPanelClipper(),
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(
                                22,
                                25,
                                24,
                                25,
                              ),
                              decoration: const BoxDecoration(
                                color: AppColors.white,
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(height: 1),
                                  Text(
                                    title,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.adamina(
                                      color: AppColors.darkBrown,
                                      fontSize: 21,
                                      height: 1.18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    description,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.adamina(
                                      color: AppColors.softBrown,

                                      fontSize: 12,
                                      height: 1.55,
                                    ),
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 46,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          CupertinoPageRoute(
                                            builder: (context) => LandingPage(),
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.bgcolor,
                                        foregroundColor: Colors.white,
                                        elevation: 0,
                                        shape: const StadiumBorder(),
                                      ),
                                      child: Text(
                                        "Let's Get Started",
                                        style: GoogleFonts.adamina(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Already have an account?',
                                        style: GoogleFonts.adamina(
                                          color: Color(0xFF594A44),

                                          fontSize: 11,
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            CupertinoPageRoute(
                                              builder: (context) =>
                                                  SignInPage(),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          'Sign In',
                                          style: GoogleFonts.adamina(
                                            decoration:
                                                TextDecoration.underline,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                            color: const Color(0xFF382B1C),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        Positioned(
                          bottom: 7,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Container(
                              width: 90,
                              height: 4,
                              decoration: BoxDecoration(
                                color: const Color(0xFF282522),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _BottomPanelClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final curveDepth = size.height * 0.08;
    return Path()
      ..moveTo(0, 0)
      ..cubicTo(
        size.width * 0.04,
        curveDepth * 0.85,
        size.width * 0.14,
        curveDepth,
        size.width * 0.28,
        curveDepth,
      )
      ..lineTo(size.width * 0.72, curveDepth)
      ..cubicTo(
        size.width * 0.88,
        curveDepth,
        size.width * 0.92,
        curveDepth * 0.5,
        size.width,
        curveDepth * 1.5,
      )
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
