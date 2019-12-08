import 'package:flutter/material.dart';
import 'package:instagram_clone/widgets/sign_in_form.dart';
import 'package:instagram_clone/widgets/sign_up_form.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  Widget currentWidget = SignInForm();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(child: child, opacity: animation,);
              },
              child: currentWidget,
            ),
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
        onPressed: () {
          setState(() {
            if (currentWidget is SignUpForm) {
              currentWidget = SignInForm();
            } else {
              currentWidget = SignUpForm();
            }
          });
        },
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(style: const TextStyle(), children: <TextSpan>[
            TextSpan(
              text: (currentWidget is SignInForm) ? "Don't have an account?" : "Already have an account?",
              style: TextStyle(
                fontWeight: FontWeight.w300,
                color: Colors.black54,
              ),
            ),
            TextSpan(
              text: (currentWidget is SignInForm) ? "  Sign In" : "  Sign Up",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue[600],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
