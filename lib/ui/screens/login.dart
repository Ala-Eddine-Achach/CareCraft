
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
  bool visible = true;

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
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: bleuTresClair,
      body: Column(
        children: [
          FadeInUp(
            duration: Duration(seconds: 1),
            child: SizedBox(
              child: ( Image.asset(care)),
                width: double.infinity,
                height: height * 0.29,
            ),
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
                              duration: Duration(seconds: 1,milliseconds: 20),
                              child: Material(
                                elevation: 8,
                                borderRadius: BorderRadius.circular(50),
                                child: SizedBox(
                                  width: width*0.86,
                                  height: height*0.05,
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
                                          borderRadius: BorderRadius.all(Radius.circular(50))
                                      ),
                                      hintText: 'Email',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: height*0.05,
                              width: width*0.86,
                              child: FadeInUp(
                                duration: Duration(seconds: 1,milliseconds:60),
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
                                    decoration:  InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: const OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.all(Radius.circular(50))
                                      ),
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
                        ],
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(top: height*0.03,bottom: height*0.03),
                      child: SizedBox(
                        height: height*0.06,
                        width: width*0.4,
                        child: FadeInUp(
                          duration: Duration(seconds: 1,milliseconds: 90),
                          child: FilledButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(bleu),
                            ),
                            child: Text('Log In'),
                            onPressed: () {
                              if(_formKey.currentState!.validate()){
                                Navigator.pushNamed(context, '/home');

                              }
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(bottom: height*0.02),
                      child: Text('Or use the following methods:',style: TextStyle(color: bleu,fontSize: 16),),
                    ),
                    FadeInUp(
                      duration: Duration(seconds: 1,milliseconds:120),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(radius: width*0.09,backgroundImage: AssetImage(google),),
                          CircleAvatar(radius: width*0.09,backgroundImage: AssetImage(whatsup),),
                          CircleAvatar(radius: width*0.09,backgroundImage: AssetImage(facebook),)
                        ],
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(top: height*0.03),
                      child: FadeInUp(
                        duration: Duration(seconds: 1,milliseconds:150),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:[
                              Text("Don't have an account yet? ",style: TextStyle(
                                  color: bleu,
                                  fontSize: 18
                              ),),
                              GestureDetector(
                                onTap: (){Navigator.pushNamed(context, '/signup');},
                                child: Text('Sign up',style: TextStyle(
                                    fontSize: 18,
                                    color: bleu,
                                    fontWeight: FontWeight.bold
                                ),),
                              )
                            ]
                        ),
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
