import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BannerSlide extends StatefulWidget {
  final double _height;

  const BannerSlide(this._height);

  @override
  _BannerSlideState createState() => _BannerSlideState();
}

class _BannerSlideState extends State<BannerSlide> {
  List<String> _imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          child: CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 1.0,
              aspectRatio: widget._height * 0.22 / 100,
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
            items: _imgList
                .map(
                  (item) => Image.network(
                    item,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                )
                .toList(),
          ),
        ),
        _buildIndicator(),
      ],
    );
  }

  Positioned _buildIndicator() => Positioned(
        bottom: 8,
        left: 8,
        child: Row(
          children: _imgList.map((url) {
            int index = _imgList.indexOf(url);
            return Container(
              width: 8,
              height: _current == index ? 8 : 1,
              margin: EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                shape: _current == index ? BoxShape.circle : BoxShape.rectangle,
                color: Colors.transparent,
              ),
            );
          }).toList(),
        ),
      );
}
