import 'package:flutter/material.dart';
import 'package:flutter_shopee_clone_ui/src/screen/home/widgets/content.dart';
import 'package:flutter_shopee_clone_ui/src/screen/home/widgets/header.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = TrackingScrollController();

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Content(_scrollController),
          Header(_scrollController),
        ],
      ),
    );
  }
}
