import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_app/core/view/auth/sign_up_screen.dart';
import 'package:food_app/core/view/auth/widgets/sign_in_form.dart';
import '../../../common/welcome_text.dart';
import '../../../utils/constants.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        title: const Text("Sign In"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const WelcomeText(
                title: "Welcome to Hewkai",
                text: "Login to Continue",
              ),
              const SizedBox(height: defaultPadding),

              const SignInForm(),
              // Google
              /*SocalButton(
                press: () async {

                },
                text: "Connect with Google",
                color: const Color(0xFF4285F4),
                icon: SvgPicture.asset(
                  'assets/icons/google.svg',
                ),
              ),*/
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text.rich(
                  TextSpan(
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontWeight: FontWeight.w500),
                    text: "Already have account? ",
                    children: <TextSpan>[
                      TextSpan(
                        text: "Sign In",
                        style: const TextStyle(color: primaryColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignUpScreen(),
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: defaultPadding),
            ],
          ),
        ),
      ),
    );
  }
}
