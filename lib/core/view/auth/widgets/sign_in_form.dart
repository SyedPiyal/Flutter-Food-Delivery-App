import 'package:flutter/material.dart';
import 'package:food_app/core/dataModel/login/login_response.dart';
import 'package:food_app/core/view/auth/sign_up_screen.dart';
import 'package:food_app/core/view/signUp/sign_up_form.dart';
import 'package:food_app/utils/entry_point.dart';
import 'package:provider/provider.dart';
import '../../../../utils/constants.dart';
import '../../../dataModel/login/login_req.dart';
import '../../../provider/login_provider.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  final LoginRequest _loginRequest = LoginRequest();

  bool _obscureText = true;

  final TextEditingController phoneController =
      TextEditingController(text: "01770995451");
  final TextEditingController emailController =
      TextEditingController(text: "rakib@gmail.com");
  final TextEditingController passwordController =
      TextEditingController(text: "Asd@12345");

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<AuthProvider>(context);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: phoneController,
            validator: phoneNumberValidator,
            onSaved: (value) => _loginRequest.phone = value,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(hintText: "Phone Number"),
          ),
          const SizedBox(height: defaultPadding),

          TextFormField(
            controller: emailController,
            validator: emailValidator,
            onSaved: (value) => _loginRequest.email = value,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(hintText: "Email Address"),
          ),
          const SizedBox(height: defaultPadding),

          TextFormField(
            controller: passwordController,
            obscureText: _obscureText,
            validator: passwordValidator,
            onSaved: (value) => _loginRequest.password = value,
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

          // Error Message Display
          if (loginProvider.errorMessage != null)
            Text(
              loginProvider.errorMessage!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.red),
            ),

          const SizedBox(height: defaultPadding),

          ElevatedButton(
            onPressed: loginProvider.isLoading
                ? null
                : () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      LoginResponse? loginResponse =
                          await loginProvider.login(_loginRequest);
                      if (loginResponse?.token != null) {
                        // Navigate to the home screen
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EntryPoint(),
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
                  },
            child: loginProvider.isLoading
                ? const CircularProgressIndicator()
                : const Text("Sign in"),
          ),
        ],
      ),
    );
  }
}
