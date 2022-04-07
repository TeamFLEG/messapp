import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:messapp/main.dart';
import 'package:messapp/utils/authentication.dart';
import '../widgets/google_sign_in_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.onClickedSignUp}) : super(key: key);

  final Function() onClickedSignUp;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Text(
                "Hey,",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 30.0,
                ),
              ),
              const Text(
                "Login Now",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 30.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                child: RichText(
                  text: TextSpan(
                      style: const TextStyle(color: Colors.blueGrey),
                      children: <TextSpan>[
                        const TextSpan(text: "If you are new / "),
                        TextSpan(
                            style: const TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                            text: "Join Now",
                            recognizer: TapGestureRecognizer()
                              ..onTap = widget.onClickedSignUp),
                      ]),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (String? value) {
                  if (value != null && value.isEmpty) {
                    return 'Email field cannot be empty';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: const InputDecoration(
                  labelText: "Password",
                ),
                validator: (String? value) {
                  if (value != null && !EmailValidator.validate(value)) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                child: RichText(
                  text: TextSpan(
                      style: const TextStyle(color: Colors.blueGrey),
                      children: <TextSpan>[
                        const TextSpan(text: "Forgot password? / "),
                        TextSpan(
                            style: const TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                            text: "Reset",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                navigatorKey.currentState!.pushNamed('/forgotPassword');
                              }),
                      ]),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Authentication.loginUser(_emailController.text,
                          _passwordController.text, context);
                      Authentication.loggedInStatus(context);
                    }
                  },
                  child: const Text("Login"),
                ),
              ),
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.0),
                  child: GoogleSignInButton()),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
