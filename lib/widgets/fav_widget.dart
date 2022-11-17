import 'package:flutter/material.dart';

class FavWidget extends StatefulWidget {
  const FavWidget({super.key});

  @override
  State<FavWidget> createState() => _FavWidgetState();
}

class _FavWidgetState extends State<FavWidget> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Center(
        child: Text("favorite widget"),
      ),
    );
  }
}
