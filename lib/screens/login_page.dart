import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:messapp/utils/authentication.dart';
import 'register_page.dart';
import 'mess_select.dart';
import '../widgets/google_sign_in_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

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
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterPage(),
                                    ),
                                  );
                                }),
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password field is required';
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
                                  print("Reset password clicked");
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
                        Authentication.loginUser(
                            _emailController.text, _passwordController.text);
                        Authentication.loggedInStatus(context);
                      }
                    },
                    child: const Text("Login"),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.0),
                  child: GoogleSignInButton()
                ),

                Padding( //Temporary button for routing
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                            const MessSelect(),
                          ),
                        );
                      }, child: const Text("Temp Button"),
                    ),
                ),
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
