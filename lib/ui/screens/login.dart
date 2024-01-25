
import 'package:animate_do/animate_do.dart';
import 'package:carecraft/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:simple_animations/simple_animations.dart';
import '../../core/Data/assetspaths.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LoginState();
}

class _LoginState extends State<LogIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _email;
  late final TextEditingController _password;
  bool visible = false;

  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
    _password = TextEditingController();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  void changeVisibility() {
    setState(() {
      if (visible) {
        visible = false;
      } else {
        visible = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery
        .of(context)
        .size
        .height;
    final double width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: bleuTresClair,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FadeInUp(
              duration: Duration(seconds: 1),
              child: SizedBox(
                child: Image.asset(care),
                width: double.infinity,
                height: height * 0.29,
              ),
            ),
            Container(
              height: height * 0.71,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color.fromRGBO(233, 237, 240, 0.8),
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //SizedBox(height: height * 0.08),
                  SizedBox(height: height * 0.01),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            } else if (!EmailValidator.validate(value)) {
                              return 'Enter a valid Email';
                            }
                            return null;
                          },
                          controller: _email,
                          onEditingComplete: () {
                            _email.text = _email.text.trim(); // Trim the trailing spaces
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            labelText: 'Email',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                        SizedBox(height: 16.0),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          obscureText: !visible,
                          controller: _password,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                              onPressed: changeVisibility,
                              icon: Icon(visible ? Icons.visibility : Icons.visibility_off,color: Colors.black,), // Use different icons based on the 'visible' state
                            ),
                            labelText: 'Password',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.03),
                  ElevatedButton(
                    style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(Size(width * 0.4, height * 0.06)),
                      backgroundColor: MaterialStateProperty.all(bleu),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, '/home');
                      }
                    },
                    child: Text('Log In',
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                  SizedBox(height: height * 0.02),
                  Text('Or use the following methods:',
                      style: TextStyle(color: bleu, fontSize: 16)),
                  SizedBox(height: height * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(radius: width * 0.09,
                          backgroundImage: AssetImage(google)),
                      CircleAvatar(radius: width * 0.09,
                          backgroundImage: AssetImage(whatsup)),
                      CircleAvatar(radius: width * 0.09,
                          backgroundImage: AssetImage(facebook)),
                    ],
                  ),
                  SizedBox(height: height * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account yet? ",
                        style: TextStyle(color: bleu, fontSize: 18),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/signup');
                        },
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                            fontSize: 18,
                            color: bleu,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }}

