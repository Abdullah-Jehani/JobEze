import 'package:flutter/material.dart';
import 'package:job_eze/providers/auth_provider.dart';
import 'package:job_eze/providers/job_provider.dart';
import 'package:job_eze/providers/theme_provider.dart';
import 'package:job_eze/providers/user_detail_provider.dart';
import 'package:job_eze/screens/secondary/get_started_screen.dart';
import 'package:job_eze/screens/secondary/tabs_screen.dart';
import 'package:job_eze/screens/auth/login_screen.dart';
import 'package:job_eze/screens/auth/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => JobProvider()),
        ChangeNotifierProvider(create: (context) => UserDetailProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider())
      ],
      child: Consumer<ThemeProvider>(builder: (context, themeConsumer, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData.light(
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
              useMaterial3: true,
              colorScheme: const ColorScheme.dark(),
              textTheme:
                  const TextTheme(bodyLarge: TextStyle(color: Colors.white))),
          themeMode: themeConsumer.themeMode,
          home: const SplashScreen(),
        );
      }),
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
    Provider.of<ThemeProvider>(context, listen: false).initialize();

    Provider.of<AuthProvider>(context, listen: false).checkFirstTime();
    Provider.of<AuthProvider>(context, listen: false).initAuthentication();
    Provider.of<JobProvider>(context, listen: false).fetchJobs();
    Provider.of<AuthProvider>(context, listen: false).getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, auth, _) {
      return auth.isLoaading == null
          ? const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : auth.isFirstTime
              ? const GetStarted()
              : auth.isAuthenticated!
                  ? const TabsScreen()
                  : const LoginScreen();
    });
  }
}
