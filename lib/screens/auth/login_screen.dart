import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:job_eze/helpers/color_helper.dart';
import 'package:job_eze/providers/auth_provider.dart';
import 'package:job_eze/screens/secondary/tabs_screen.dart';
import 'package:job_eze/screens/auth/register_screen.dart';
import 'package:job_eze/widgets/input_field.dart';
import 'package:job_eze/widgets/sign_in_methods_widget.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _LoginScreenState extends State<LoginScreen> {
  bool isValid = false;
  validation() async {
    if (emailController.text.isNotEmpty &&
        emailController.text.length >= 9 &&
        passwordController.text.length > 7) {
      isValid = true;
    } else {
      isValid = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Image.asset(
                'assets/images/Screenshot_2023-09-26_231320-removebg-preview.png',
                height: 120,
                width: 120,
              ),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 200),
                child: Text(
                  textAlign: TextAlign.start,
                  'Login',
                  style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 50),
                child: Text(
                  'Login to continue using the app',
                  style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 14,
                      color: Color.fromARGB(255, 233, 194, 241),
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 65, bottom: 10),
                      child: Text(
                        'Email',
                        style: TextStyle(
                            fontFamily: 'poppins', fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 55,
                      ),
                      child: InputField(
                        isPassword: false,
                        controller: emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please enter an email';
                          }
                          if (value.length < 9) {
                            return 'please enter a valid email';
                          }
                          return '';
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 65, bottom: 10),
                      child: Text(
                        'Password',
                        style: TextStyle(
                            fontFamily: 'poppins', fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 55,
                        ),
                        child: InputField(
                          isPassword: true,
                          controller: passwordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter a password';
                            }
                            if (value.length < 8) {
                              return 'please enter a valid password';
                            }
                            return '';
                          },
                        )),
                    Column(
                      children: [
                        const SizedBox(
                          height: 19,
                        ),
                        TextButton(
                          onPressed: () {
                            validation();
                            if (isValid) {
                              Provider.of<AuthProvider>(context, listen: false)
                                  .login({
                                "phone": emailController.text.toString(),
                                "password": passwordController.text.toString(),
                                "device_name": "iphone"
                              }, context).then((value) {
                                if (value.first) {
                                  passwordController.clear();
                                  emailController.clear();

                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) =>
                                            const TabsScreen()),
                                  );
                                } else {
                                  SnackBar snackBar =
                                      SnackBar(content: Text(value.last));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              });
                            } else {
                              SnackBar snackBar = const SnackBar(
                                  content: Text('your input is invalid'));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Color(0xFF0056DD),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 130, vertical: 13),
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'poppins',
                                    fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              const Expanded(
                                  child: Divider(
                                thickness: .3,
                              )),
                              Text(
                                '  Or login With   ',
                                style: TextStyle(
                                    fontFamily: 'poppins', color: purpleColor),
                              ),
                              const Expanded(
                                  child: Divider(
                                thickness: .3,
                              ))
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 55),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SignInMethods(
                                imageSocial:
                                    'assets/images/Screenshot_2023-09-24_185723-removebg-preview.png',
                                height: 40,
                                width: 40,
                              ),
                              SignInMethods(
                                imageSocial:
                                    'assets/images/Google_Icons-09-512.webp',
                                width: 40,
                                height: 40,
                              ),
                              SignInMethods(
                                imageSocial:
                                    'assets/images/images-removebg-preview.png',
                                width: 45,
                                height: 45,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 55,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Get your Carrer Started',
                              style: TextStyle(
                                  fontFamily: 'poppins',
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (context) =>
                                              const RegisterScreen()));
                                  emailController.clear();
                                  passwordController.clear();
                                },
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      color: Color(0xFF0056DD),
                                      fontFamily: 'poppins',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ))
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
