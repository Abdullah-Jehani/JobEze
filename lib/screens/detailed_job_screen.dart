import 'package:flutter/material.dart';

class DetailedJobScreen extends StatefulWidget {
  const DetailedJobScreen({super.key});

  @override
  State<DetailedJobScreen> createState() => _DetailedJobScreenState();
}

class _DetailedJobScreenState extends State<DetailedJobScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('navigation'),
      ),
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'dsdsds'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'dsdsd'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'dsdsds'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              label: 'dsds'),
        ],
      ),
    );
  }
}
