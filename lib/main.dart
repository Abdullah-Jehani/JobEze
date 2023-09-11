import 'package:flutter/material.dart';
import 'package:job_eze/providers/auth_provider.dart';
import 'package:job_eze/screens/get_started_screen.dart';
import 'package:job_eze/screens/home_screen.dart';
import 'package:job_eze/screens/login_screen.dart';
import 'package:job_eze/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => AuthProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}

class ScreenRouter extends StatefulWidget {
  const ScreenRouter({super.key});

  @override
  State<ScreenRouter> createState() => _ScreenRouterState();
}

class _ScreenRouterState extends State<ScreenRouter> {
  @override
  void initState() {
    Provider.of<AuthProvider>(context, listen: false).checkFirstTime();
    Provider.of<AuthProvider>(context, listen: false).initAuthentication();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, auth, _) {
      return auth.isLoaading!
          ? const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : auth.isFirstTime
              ? const GetStarted()
              : auth.isAuthenticated
                  ? const HomeScreen()
                  : const LoginScreen();
    });
  }
}
