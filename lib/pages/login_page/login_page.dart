import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
      _buildSignInWithGoogleButton(),
    ]);
  }

  Widget _buildSignInWithGoogleButton() {
    return SizedBox(
      child: ElevatedButton(
        onPressed: () {
          //TODO: Sign In With Google
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
        ),
        child: Text.rich(
          TextSpan(
            children: [
              const TextSpan(
                text: 'Sign in with Google',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const WidgetSpan(
                child: SizedBox(width: 8),
              ),
              WidgetSpan(
                alignment: PlaceholderAlignment.top,
                child: Image.asset(
                  'assets/images/google_logo.png',
                  width: 16,
                  filterQuality: FilterQuality.medium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
