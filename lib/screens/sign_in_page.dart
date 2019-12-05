import 'package:flutter/material.dart';
import 'package:instagram_clone/widgets/sign_in_form.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SignInForm(),
            _goToSignUpPageButton(context),
          ],
        ),
      ),
    );
  }

  Positioned _goToSignUpPageButton(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      height: 40,
      child: FlatButton(
        shape: Border(
          top: BorderSide(
            color: Colors.grey[300],
          ),
        ),
        onPressed: null,
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: const TextStyle(),
            children: <TextSpan>[
              TextSpan(
                text: "Don't have an account?",
                    style: TextStyle(
                      fontWeight: FontWeight.w300, color: Colors.black54,
                    ),
              ),
              TextSpan(
                text: "  Sign Up",
                    style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blue[600],
                    ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}
