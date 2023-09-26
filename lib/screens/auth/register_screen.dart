import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_eze/providers/auth_provider.dart';
import 'package:job_eze/screens/auth/login_screen.dart';
import 'package:job_eze/screens/secondary/tabs_screen.dart';
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
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        // appBar: AppBar(
        //   title: Image.asset(
        //     'assets/images/Screenshot_2023-09-26_165855-removebg-preview.png',
        //     height: 120,
        //     width: 120,
        //   ),
        //   centerTitle: true,
        //   actions: [
        //     Padding(
        //       padding: const EdgeInsets.only(right: 10),
        //       child: GestureDetector(
        //         onTap: () {
        //           Navigator.push(
        //               context,
        //               CupertinoPageRoute(
        //                   builder: (context) => const LoginScreen()));
        //         },
        //         child: const Text(
        //           'Login',
        //           style: TextStyle(
        //               fontFamily: 'poppins',
        //               fontSize: 18,
        //               fontWeight: FontWeight.bold,
        //               color: Color(0xFF0056DD)),
        //         ),
        //       ),
        //     )
        //   ],
        // ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/Screenshot_2023-09-26_231320-removebg-preview.png',
                  height: 120,
                  width: 120,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 120),
                  child: Text(
                    'Register Today',
                    style: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 50),
                  child: Text(
                    'Find Your Perfect Job, Today !',
                    style: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 16,
                        color: Color.fromARGB(255, 233, 194, 241),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 30,
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
                        padding: EdgeInsets.only(left: 55, bottom: 10),
                        child: Text(
                          'username',
                          style: TextStyle(fontFamily: 'poppins'),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 45,
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
                        height: 10,
                      ),
                      // 2 - Email
                      const Padding(
                        padding: EdgeInsets.only(left: 55, bottom: 10),
                        child: Text(
                          'Email',
                          style: TextStyle(fontFamily: 'poppins'),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 45,
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
                        height: 10,
                      ),
                      // 3- password
                      const Padding(
                        padding: EdgeInsets.only(left: 55, bottom: 10),
                        child: Text(
                          'Password',
                          style: TextStyle(fontFamily: 'poppins'),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 45,
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
                        height: 10,
                      ),
                      // 4- confirm password
                      const Padding(
                        padding: EdgeInsets.only(left: 55, bottom: 10),
                        child: Text(
                          'Confirm Password',
                          style: TextStyle(fontFamily: 'poppins'),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 45,
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
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 0),
                      child: TextButton(
                        onPressed: () {
                          validator();
                          if (isValid) {
                            Provider.of<AuthProvider>(context, listen: false)
                                .register({
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
                                  (route) => false,
                                );
                              } else {
                                SnackBar snackBar =
                                    SnackBar(content: value.last);
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
                            color: Color(0xFF005AE2),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 120, vertical: 15),
                            child: Text(
                              'register',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'poppins',
                                  fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Get your Carrer Started',
                          style: TextStyle(
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.normal,
                              fontSize: 17),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()));
                              emailController.clear();
                              passwordController.clear();
                            },
                            child: const Text(
                              'Login',
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
          ),
        ),
      ),
    );
  }
}
