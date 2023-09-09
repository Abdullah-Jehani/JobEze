import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_eze/screens/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('HomeScreen'),
            FloatingActionButton(onPressed: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => const LoginScreen()));
            }),
            // TextButton(
            //   onPressed: () {
            //     Provider.of<AuthProvider>(context, listen: false).clearCache();
            //   },
            //   child: const Text('Clear Cache'),
            // )
          ],
        ),
      ),
    );
  }
}
