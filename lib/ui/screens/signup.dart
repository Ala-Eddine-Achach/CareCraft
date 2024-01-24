
import 'package:animate_do/animate_do.dart';
import 'package:carecraft/ui/theme.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/Data/assetspaths.dart';


class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _email;
  late final TextEditingController _password;
  late final TextEditingController _name;
  late final TextEditingController _cpassword;
  bool visible = true;
  bool _checked=false;

  @override
  void initState() {
    super.initState();
    _name = TextEditingController();
    _cpassword = TextEditingController();
    _email = TextEditingController();
    _password = TextEditingController();
  }

  @override
  void dispose() {
    _cpassword.dispose();
    _name.dispose();
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
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: bleuTresClair,
      body: Column(
        children: [
          SizedBox(
            child: FadeInUp(duration: Duration(seconds: 1), child:Image.asset(care),),
            width: double.infinity,
            height: height * 0.29,
          ),
          Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(233, 237, 240, 0.8),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.08,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FadeInUp(
                              duration: Duration(seconds: 1,milliseconds:10),
                              child: Material(
                                elevation: 8,
                                borderRadius: BorderRadius.circular(50),
                                child: SizedBox(
                                  width: width * 0.86,
                                  height: height * 0.05,
                                  child: TextFormField(
                                    validator: (value) {
                                      if(value==null || value.isEmpty)
                                        {
                                          return "Enter a username";
                                        }
                                      else
                                        {
                                          return null;
                                        }
                                    },
                                    controller: _name,
                                    autocorrect: false,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: const InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(50))),
                                      hintText: 'User Name',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FadeInUp(
                              duration: Duration(seconds: 1,milliseconds:30),
                              child: Material(
                                elevation: 8,
                                borderRadius: BorderRadius.circular(50),
                                child: SizedBox(
                                  width: width * 0.86,
                                  height: height * 0.05,
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter some text';
                                      } else if (!EmailValidator.validate(value)) {
                                        return 'Enter a valid Email';
                                      }
                                      return null;
                                    },
                                    controller: _email,
                                    autocorrect: false,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: const InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(50))),
                                      hintText: 'Email',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FadeInUp(
                              duration: Duration(seconds: 1,milliseconds: 60),
                              child: SizedBox(
                                height: height * 0.05,
                                width: width * 0.86,
                                child: Material(
                                  elevation: 8,
                                  borderRadius: BorderRadius.circular(50),
                                  child: TextFormField(
                                    validator: (value){
                                      if(value==null || value.isEmpty){
                                        return 'Enter a valid password';
                                      }
                                      return null;
                                    },
                                    obscureText: visible,
                                    autocorrect: false,
                                    enableSuggestions: false,
                                    controller: _password,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: const OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(50))),
                                      suffix: IconButton(
                                          onPressed: changeVisibility,
                                          icon: Icon(visible == true
                                              ? Icons.remove_red_eye
                                              : Icons.password_sharp)),
                                      hintText: 'Password',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FadeInUp(
                              duration: Duration(seconds: 1,milliseconds: 80),
                              child: SizedBox(
                                height: height * 0.05,
                                width: width * 0.86,
                                child: Material(
                                  elevation: 8,
                                  borderRadius: BorderRadius.circular(50),
                                  child: TextFormField(
                                    validator: (value){
                                      if(value==null ||value.isEmpty){
                                        return 'Confirm Ur Password pls';
                                      }
                                      else if(value!=_password.text) {
                                        return "Passwords don't match";
                                      }
                                      return null;
                                    },
                                    obscureText: visible,
                                    autocorrect: false,
                                    enableSuggestions: false,
                                    controller: _cpassword,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: const OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(50))),
                                      suffix: IconButton(
                                          onPressed: changeVisibility,
                                          icon: Icon(visible == true
                                              ? Icons.remove_red_eye
                                              : Icons.password_sharp)),
                                      hintText: 'Confirm Password',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Row(
                      children: [
                        FadeInUp(
                          child: Checkbox(
                            value: _checked,
                            onChanged: (value) {
                              setState(() {
                                _checked=value as bool;
                              });
                            },
                          ),
                          duration: Duration(seconds: 1,milliseconds: 100),
                        ),
                        FadeInUp(
                          duration: Duration(seconds: 1,milliseconds:120),
                          child: const Text.rich(TextSpan(
                              text: 'Agree to',
                              style: TextStyle(color: Colors.grey),
                              children:[
                                TextSpan(text: 'Terms and conditions',style: TextStyle(
                                    color: Colors.grey,fontWeight: FontWeight.bold
                                ))
                              ]
                          )),
                        )],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: height * 0.03, bottom: height * 0.03),
                      child: SizedBox(
                        height: height * 0.06,
                        width: width * 0.4,
                        child: Builder(
                            builder: (context) {
                              return FadeInUp(
                                duration: Duration(seconds: 1,milliseconds: 150),
                                child: FilledButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                    MaterialStateProperty.all(bleu),
                                  ),
                                  child: Text('Sign Up'),
                                  onPressed: () {
                                    if(_formKey.currentState!.validate()){
                                      if(!_checked){
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text('Please agree to the terms and conditions'))
                                        );
                                      }
                                      else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                            SnackBar(content:
                                                FittedBox(
                                                  fit: BoxFit.fill,
                                                  child: Text(
                                                      'You have been Successfully signed in,You will be redirected'),
                                                )
                                            ),
                                        );
                                        Future.delayed(Duration(seconds: 1,milliseconds: 500),() {
                                          Navigator.pushNamed(context, '/login');
                                        },);
                                      }
                                      }
                                  },
                                ),
                              );
                            }
                        ),
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
