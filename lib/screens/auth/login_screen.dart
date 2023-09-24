import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_eze/helpers/color_helper.dart';
import 'package:job_eze/providers/auth_provider.dart';
import 'package:job_eze/screens/secondary/tabs_screen.dart';
import 'package:job_eze/screens/auth/register_screen.dart';
import 'package:job_eze/widgets/input_field.dart';
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 45,
            ),
            const Text(
              'LOGO',
              style: TextStyle(fontFamily: 'poppins', fontSize: 30),
            ),
            Image.asset(
              'assets/images/green.jpg',
              width: size.width * 318,
              height: size.height * .400,
            ),
            Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 65, bottom: 10),
                    child: Text(
                      'Email',
                      style: TextStyle(fontFamily: 'poppins'),
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
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 65, bottom: 10),
                    child: Text(
                      'Password',
                      style: TextStyle(fontFamily: 'poppins'),
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
                                      builder: (context) => const TabsScreen()),
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
                          decoration: BoxDecoration(
                              color: greenColor,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5))),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 40, vertical: 10),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.white, fontFamily: 'poppins'),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
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
                              },
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                    color: greenColor,
                                    fontFamily: 'poppins',
                                    fontSize: 16),
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
    );
  }
}
