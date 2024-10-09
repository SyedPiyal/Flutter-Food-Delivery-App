import 'package:flutter/material.dart';
import 'package:food_app/core/dataModel/signup/signup_request.dart';
import 'package:food_app/core/dataModel/signup/signup_response.dart';
import 'package:provider/provider.dart';
import '../../../utils/constants.dart';
import '../../provider/login_provider.dart';
import '../phoneLogin/phone_login_screen.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final SignupRequest _signupRequest = SignupRequest();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final signupProvider = Provider.of<AuthProvider>(context);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Full Name Field
          TextFormField(
            validator: requiredValidator,
            onSaved: (value) =>_signupRequest.fName,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(hintText: "Full Name"),
          ),
          const SizedBox(height: defaultPadding),

          // Email Field
          TextFormField(
            validator: emailValidator,
            onSaved: (value) =>_signupRequest.email,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(hintText: "Email Address"),
          ),
          const SizedBox(height: defaultPadding),

          // Password Field
          TextFormField(
            obscureText: _obscureText,
            validator: passwordValidator,
            textInputAction: TextInputAction.next,
            onChanged: (value) {},
            onSaved: (value) =>_signupRequest.password,
            decoration: InputDecoration(
              hintText: "Password",
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: _obscureText
                    ? const Icon(Icons.visibility_off, color: bodyTextColor)
                    : const Icon(Icons.visibility, color: bodyTextColor),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),

          // Confirm Password Field
          TextFormField(
            obscureText: _obscureText,
            onSaved: (value) =>_signupRequest.password,
            decoration: InputDecoration(
              hintText: "Confirm Password",
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: _obscureText
                    ? const Icon(Icons.visibility_off, color: bodyTextColor)
                    : const Icon(Icons.visibility, color: bodyTextColor),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          // Error Message Display
          if (signupProvider.errorMessage != null)
            Text(
              signupProvider.errorMessage!,
              style: const TextStyle(color: Colors.red),
            ),

          const SizedBox(height: defaultPadding),

          // Sign Up Button
          ElevatedButton(
            onPressed: signupProvider.isLoading
                ? null
                : () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                SignupResponse? signupResponse =
                await signupProvider.signUp(_signupRequest);
                if (signupResponse?.token != null) {
                  // Navigate to the home screen
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PghoneLoginScreen(),
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Login Successful"),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Login Failed"),
                    ),
                  );
                }
              }
            },/*() {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => const PghoneLoginScreen(),
                ),
              );
            },*/
            child:  signupProvider.isLoading
                ? const CircularProgressIndicator()
                : const Text("Sign Up"),
          ),
        ],
      ),
    );
  }
}
