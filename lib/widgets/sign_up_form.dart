import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/sizes.dart';
import 'package:instagram_clone/main_page.dart';
import 'package:instagram_clone/utils/simple_snack_bar.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _inputPasswordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _inputPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(common_gap),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Spacer(
                  flex: 6,
                ),
                Image.asset('assets/insta_text_logo.png'),
                Spacer(
                  flex: 1,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: getTextFieldDecoration("Email"),
                  validator: (String value) {
                    if (value.isEmpty || !value.contains("@")) {
                      return "Please enter your email address!";
                    }
                    return null;
                  },
                ),
                Spacer(
                  flex: 1,
                ),
                TextFormField(
                  controller: _inputPasswordController,
                  decoration: getTextFieldDecoration("Password"),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Please enter any password!";
                    }
                    return null;
                  },
                ),
                Spacer(
                  flex: 1,
                ),
                TextFormField(
                  controller: _confirmPasswordController,
                  decoration: getTextFieldDecoration("Confirm Password"),
                  validator: (String value) {
                    if (value.isEmpty || value != _inputPasswordController.text) {
                      return "Password does not match!";
                    }
                    return null;
                  },
                ),
                Spacer(
                  flex: 2,
                ),
                FlatButton(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  disabledColor: Colors.blue[100],
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      final route = MaterialPageRoute(builder: (context) => MainPage());
                      Navigator.pushReplacement(context, route);
                    }
                  },
                ),
                Spacer(
                  flex: 2,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Positioned(
                      left: 0,
                      right: 0,
                      height: 1,
                      child: Container(
                        color: Colors.grey[300],
                        height: 1,
                      ),
                    ),
                    Container(
                      height: 3,
                      width: 50,
                      color: Colors.grey[50],
                    ),
                    Text(
                      "OR",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Spacer(
                  flex: 2,
                ),
                FlatButton.icon(
                  textColor: Colors.blue,
                  onPressed: () {
                    simpleSnackBar(context, "Facebook pressed");
                  },
                  icon: ImageIcon(
                    AssetImage("assets/icon/facebook.png"),
                  ),
                  label: Text("Login with Facebook"),
                ),
                Spacer(
                  flex: 2,
                ),
                Spacer(
                  flex: 6,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration getTextFieldDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey[300],
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey[300],
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      fillColor: Colors.grey[100],
      filled: true,
    );
  }
}
