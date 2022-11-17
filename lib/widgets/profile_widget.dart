import 'package:flutter/material.dart';

class Profilewidget extends StatefulWidget {
  const Profilewidget({super.key});

  @override
  State<Profilewidget> createState() => _ProfilewidgetState();
}

class _ProfilewidgetState extends State<Profilewidget> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Center(
        child: Text("profile widget"),
      ),
    );
  }
}
