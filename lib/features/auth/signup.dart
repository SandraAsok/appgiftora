import 'package:appgiftora/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _otpController = TextEditingController();
  bool _hidePassword = true;
  bool _hideConfirmPassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneController.dispose();
    _otpController.dispose();
    super.dispose();
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  InputDecoration _decoration(String label, {Widget? suffixIcon}) =>
      InputDecoration(
        labelText: label,
        filled: true,
        fillColor: const Color(0xFFF8F5F1),
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFFE9E2DA)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFFE9E2DA)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFF98583D), width: 1.5),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFCF8),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 430),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 8),
                  Text(
                    'GIFTORA',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.abrilFatface(
                      color: AppColors.bgcolor,
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 3,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Create your account',
                    style: GoogleFonts.adamina(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Join us and find something special.',
                    style: GoogleFonts.adamina(
                      color: Colors.black54,
                      fontSize: 11,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 24),
                  TextField(
                    strutStyle: const StrutStyle(height: 1.1),
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    autofillHints: const [AutofillHints.email],
                    decoration: _decoration(
                      'Email address',
                      suffixIcon: const Icon(Icons.email_outlined),
                    ),
                  ),
                  const SizedBox(height: 14),
                  TextField(
                    strutStyle: const StrutStyle(height: 1.1),
                    controller: _passwordController,
                    obscureText: _hidePassword,
                    autofillHints: const [AutofillHints.newPassword],
                    decoration: _decoration(
                      'Password',
                      suffixIcon: IconButton(
                        onPressed: () =>
                            setState(() => _hidePassword = !_hidePassword),
                        icon: Icon(
                          _hidePassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  TextField(
                    strutStyle: const StrutStyle(height: 1.1),
                    controller: _confirmPasswordController,
                    obscureText: _hideConfirmPassword,
                    autofillHints: const [AutofillHints.newPassword],
                    decoration: _decoration(
                      'Confirm password',
                      suffixIcon: IconButton(
                        onPressed: () => setState(
                          () => _hideConfirmPassword = !_hideConfirmPassword,
                        ),
                        icon: Icon(
                          _hideConfirmPassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  SizedBox(
                    height: 52,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_passwordController.text !=
                            _confirmPasswordController.text) {
                          _showMessage('Passwords do not match.');
                        } else {
                          _showMessage('Email sign-up selected.');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.bgcolor,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: Text(
                        'Create account',
                        style: GoogleFonts.adamina(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    children: [
                      Expanded(child: Divider()),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14),
                        child: Text(
                          'OR CONTINUE WITH',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                      Expanded(child: Divider()),
                    ],
                  ),
                  const SizedBox(height: 16),
                  OutlinedButton.icon(
                    onPressed: () => _showMessage('Google sign-up selected.'),
                    icon: const Icon(
                      Icons.g_mobiledata,
                      size: 28,
                      color: AppColors.bgcolor,
                    ),
                    label: const Text('Continue with Google'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.black,
                      minimumSize: const Size.fromHeight(50),
                      side: const BorderSide(color: AppColors.bgcolor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),
                  const SizedBox(height: 22),
                  Text(
                    'Sign up with phone',
                    style: GoogleFonts.adamina(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          strutStyle: const StrutStyle(height: 1.1),
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: _decoration(
                            'Phone number',
                            suffixIcon: const Icon(Icons.phone_outlined),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      OutlinedButton(
                        onPressed: () => _showMessage('OTP requested.'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.bgcolor,
                          minimumSize: const Size(75, 45),
                          side: const BorderSide(color: AppColors.bgcolor),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: const Text('Get OTP'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _otpController,
                    keyboardType: TextInputType.number,
                    decoration: _decoration(
                      'Enter OTP',
                      suffixIcon: const Icon(Icons.lock_outline),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 50,
                    child: OutlinedButton(
                      onPressed: () => _showMessage('Phone sign-up selected.'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.bgcolor,
                        side: const BorderSide(color: AppColors.bgcolor),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: const Text('Verify & create account'),
                    ),
                  ),
                  const SizedBox(height: 22),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account?'),
                      TextButton(
                        onPressed: () => _showMessage('Sign in selected.'),
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.bgcolor,
                        ),
                        child: const Text(
                          'Sign in',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
