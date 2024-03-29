import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/sizes.dart';
import 'package:instagram_clone/main_page.dart';
import 'package:instagram_clone/utils/simple_snack_bar.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
            child: ListView(
//              mainAxisAlignment: MainAxisAlignment.center,
//              mainAxisSize: MainAxisSize.max,
//              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 90,
                ),
                Image.asset('assets/insta_text_logo.png'),
                SizedBox(
                  height: 15,
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
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: getTextFieldDecoration("Password"),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Please enter your password!";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Forgotten password?",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: Colors.blue[700],
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                FlatButton(
                  child: Text(
                    "Login",
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
                SizedBox(
                  height: 30,
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
                SizedBox(
                  height: 30,
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
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 90,
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
