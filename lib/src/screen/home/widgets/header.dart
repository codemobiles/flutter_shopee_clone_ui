import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  final TrackingScrollController scrollController;

  Header(this.scrollController);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  Color _backgroundColor;
  Color _backgroundColorSearch;
  Color _colorIcon;
  double _opacity;
  double _offset;

  final _opacityMax = 0.03;

  @override
  void initState() {
    _backgroundColor = Colors.transparent;
    _backgroundColorSearch = Colors.white;
    _colorIcon = Colors.white;
    _opacity = 0.0;
    _offset = 0.0;

    widget.scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.scrollController.offset <= -50
        ? SizedBox()
        : Container(
            color: _backgroundColor,
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    _buildSearch(),
                    SizedBox(width: 18),
                    _buildIconButton(
                        onPressed: () => print("click"),
                        icon: Icons.shopping_cart,
                        notification: 20),
                    _buildIconButton(
                        onPressed: () => print("click"),
                        icon: Icons.chat,
                        notification: 9),
                  ],
                ),
              ),
            ),
          );
  }

  Stack _buildIconButton(
          {VoidCallback onPressed, IconData icon, int notification = 0}) =>
      Stack(
        children: <Widget>[
          IconButton(
            iconSize: 32,
            onPressed: onPressed,
            icon: Icon(icon),
            color: _colorIcon,
          ),
          notification == 0
              ? SizedBox()
              : Positioned(
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Colors.deepOrangeAccent,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 24,
                      minHeight: 24,
                    ),
                    child: Text(
                      '$notification',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
        ],
      );

  Expanded _buildSearch() => Expanded(
        child: TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(4),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.transparent,
                width: 0,
              ),
              borderRadius: const BorderRadius.all(
                const Radius.circular(6.0),
              ),
            ),
            isDense: true,
            hintText: "Shopee",
            hintStyle: TextStyle(
              fontSize: 18,
              color: Colors.deepOrange,
            ),
            prefixIcon: Icon(Icons.search),
            suffixIcon: Icon(Icons.camera_alt),
            filled: true,
            fillColor: _backgroundColorSearch,
          ),
        ),
      );

  _onScroll() {
    final scrollOffset = widget.scrollController.offset;
    if (scrollOffset >= _offset && scrollOffset > 10) {
      _opacity = double.parse((_opacity + _opacityMax).toStringAsFixed(2));
      if (_opacity >= 1.0) {
        _opacity = 1.0;
      }
      _offset = scrollOffset;
    } else if (scrollOffset < 20) {
      _opacity = double.parse((_opacity - _opacityMax).toStringAsFixed(2));
      if (_opacity <= 0.0) {
        _opacity = 0.0;
      }
    }

    setState(() {
      if (scrollOffset <= 0) {
        _backgroundColorSearch = Colors.white;
        _colorIcon = Colors.white;
        _offset = 0.0;
      } else {
        _backgroundColorSearch = Colors.grey[200];
        _colorIcon = Colors.deepOrange;
      }

      _backgroundColor = Colors.white.withOpacity(_opacity);
    });
  }
}
