import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/di/locator.dart';
import '../../cubit/login_page/login_page_cubit.dart';

class LoginPage extends StatefulWidget implements AutoRouteWrapper {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<LoginPageCubit>(),
      child: this,
    );
  }
}

void _onStateChanged(
  BuildContext context,
  LoginPageState state,
) {
  switch (state.status) {
    case LoginPageStatus.error:
      break;
    case LoginPageStatus.initial:
    case LoginPageStatus.loading:
    case LoginPageStatus.success:
      break;
  }
}

class _LoginPageState extends State<LoginPage> {
  LoginPageCubit get cubit => context.read();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginPageCubit, LoginPageState>(
      listener: _onStateChanged,
      builder: (context, state) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildSignInWithGoogleButton(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSignInWithGoogleButton() {
    return SizedBox(
      child: ElevatedButton(
        onPressed: cubit.signInWithGoogle,
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
