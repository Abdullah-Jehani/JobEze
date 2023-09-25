import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_eze/providers/auth_provider.dart';
import 'package:job_eze/screens/secondary/tabs_screen.dart';
import 'package:job_eze/screens/auth/login_screen.dart';
import 'package:job_eze/widgets/input_field.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool hidePass = true;
  bool isValid = false;
  validator() async {
    if (userNameController.text.length > 2 &&
        emailController.text.length >= 9 &&
        emailController.text.contains('@') &&
        passwordController.text.length > 7 &&
        confirmPasswordController.text == passwordController.text) {
      isValid = true;
    } else {
      isValid = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 80,
              ),
              Image.asset(
                'assets/images/Screenshot_2023-09-23_195743-removebg-preview.png',
                height: 70,
                width: 70,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Register Today , Work Tomorrow',
                style: TextStyle(fontFamily: 'poppins', fontSize: 16),
              ),
              const Text(
                'Find Your Perfect Job',
                style: TextStyle(
                    fontFamily: 'poppins', fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                onChanged: () {
                  validator();
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 1- Username
                    const Padding(
                      padding: EdgeInsets.only(left: 65, bottom: 10),
                      child: Text(
                        'username',
                        style: TextStyle(fontFamily: 'poppins'),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 55,
                        ),
                        child: InputField(
                            controller: userNameController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'please enter a username';
                              }
                              if (value.length < 3) {
                                return 'please enter real name';
                              }
                              return '';
                            },
                            isPassword: false)),
                    const SizedBox(
                      height: 7,
                    ),
                    // 2 - Email
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
                            controller: emailController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'please enter an email';
                              }
                              if (value.length < 9) {
                                return 'please enter a valid email';
                              }
                              if (value.contains('@') == false) {
                                return 'please enter a valid email';
                              }
                              if (value.contains('.') == false) {
                                return 'please enter a valid email';
                              }
                              return '';
                            },
                            isPassword: false)),
                    const SizedBox(
                      height: 7,
                    ),
                    // 3- password
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
                            controller: passwordController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'please enter a password';
                              }
                              if (value.length < 8) {
                                return 'password must be 9 characters long';
                              }
                              return '';
                            },
                            isPassword: true)),
                    const SizedBox(
                      height: 7,
                    ),
                    // 4- confirm password
                    const Padding(
                      padding: EdgeInsets.only(left: 65, bottom: 10),
                      child: Text(
                        'Confirm Password',
                        style: TextStyle(fontFamily: 'poppins'),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 55,
                        ),
                        child: InputField(
                            controller: confirmPasswordController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'please enter a password';
                              }
                              if (value.length < 9) {
                                return 'please enter the same password';
                              }
                              return '';
                            },
                            isPassword: true)),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  validator();
                  if (isValid) {
                    Provider.of<AuthProvider>(context, listen: false).register({
                      "name": userNameController.text.toString(),
                      "phone": emailController.text.toString(),
                      "password": passwordController.text.toString(),
                      "password_confirmation":
                          confirmPasswordController.text.toString(),
                      "device_name": "iphone"
                    }, context).then((value) {
                      if (value.first) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => const TabsScreen()),
                            (route) => false);
                      } else {
                        SnackBar snackBar = SnackBar(content: value.last);
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    });
                  } else {
                    SnackBar snackBar =
                        const SnackBar(content: Text('your input is invalid'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color(0xFF005AE2),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    child: Text(
                      'register',
                      style:
                          TextStyle(color: Colors.white, fontFamily: 'poppins'),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'already have account ?',
                    style: TextStyle(fontFamily: 'poppins', fontSize: 16),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const LoginScreen()));
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                          color: Color(0xFF005AE2),
                          fontFamily: 'poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
