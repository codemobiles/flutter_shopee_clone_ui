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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Content(
            scrollController: _scrollController,
            height: size.height,
          ),
          Header(_scrollController),
        ],
      ),
    );
  }
}
