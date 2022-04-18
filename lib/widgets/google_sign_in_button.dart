import 'package:flutter/material.dart';
import '../utils/authentication.dart';

class GoogleSignInButton extends StatefulWidget {
  final bool registered;
  const GoogleSignInButton({Key? key, required this.registered})
      : super(key: key);

  @override
  _GoogleSignInButtonState createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  bool _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return _isSigningIn
        ? const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Center(
              child: SizedBox(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(),
              ),
            ),
          )
        : SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
              ),
              onPressed: () async {
                setState(() {
                  _isSigningIn = true;
                });

                await Authentication.signInWithGoogle(context: context, registered: widget.registered);

                setState(() {
                  _isSigningIn = false;
                });
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Image(
                      image: AssetImage("assets/google_logo.png"),
                      height: 20.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Sign in with Google',
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
