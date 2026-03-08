import 'package:flutter/material.dart';
import 'package:take_note/widgets/custom_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              CustomAppBar(
                userName: 'Chidiebere',
                userPhoto: 'assets/avatar1.png',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
