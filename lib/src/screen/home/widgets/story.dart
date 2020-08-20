import 'package:flutter/material.dart';
import 'package:flutter_shopee_clone_ui/src/models/story_model.dart';
import 'package:flutter_shopee_clone_ui/src/viewmodels/story_view_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Story extends StatelessWidget {
  final List<StoryModel> _storiesViewModel = StoryViewModel().getStories();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          _buildStoryList(),
        ],
      ),
    );
  }

  Padding _buildHeader() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Text(
          "SHOPEE STORY",
          style: TextStyle(
            color: Colors.deepOrange,
            fontWeight: FontWeight.w500,
          ),
        ),
      );

  Container _buildStoryList() => Container(
        height: 105,
        margin: EdgeInsets.only(top: 14),
        child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 12),
          scrollDirection: Axis.horizontal,
          itemCount: _storiesViewModel.length,
          itemBuilder: (BuildContext context, int index) {
            return StoryItem(_storiesViewModel[index]);
          },
          separatorBuilder: (BuildContext context, int index) =>
              SizedBox(width: 14),
        ),
      );
}

class StoryItem extends StatelessWidget {
  final StoryModel story;

  const StoryItem(this.story);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final sizeImage = constraints.maxHeight - 30;
        return Column(
          children: [
            CustomPaint(
              painter: GradientPainter(sizeImage),
              child: GestureDetector(
                onTap: () {
                  print("click");
                },
                child: Container(
                  width: sizeImage,
                  height: sizeImage,
                  padding: EdgeInsets.all(5),
                  child: ClipOval(
                    child: SvgPicture.network(
                      story.image,
                      height: 20,
                      width: 20,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 12),
            Text(
              story.title,
              style: TextStyle(
                color: Colors.black,
              ),
            )
          ],
        );
      },
    );
  }
}

class GradientPainter extends CustomPainter {
  final double sizeImage;

  GradientPainter(this.sizeImage);

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = sizeImage / 2;
    final double strokeWidth = 3;

    Rect outerRect = Offset.zero & size;
    final outerRRect = RRect.fromRectAndRadius(
      outerRect,
      Radius.circular(radius),
    );

    final innerRRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        strokeWidth,
        strokeWidth,
        size.width - strokeWidth * 2,
        size.height - strokeWidth * 2,
      ),
      Radius.circular(radius),
    );

    Path path1 = Path()..addRRect(outerRRect);
    Path path2 = Path()..addRRect(innerRRect);
    final path = Path.combine(PathOperation.difference, path1, path2);

    final Paint paint = Paint();
    paint.shader = LinearGradient(
      colors: [
        Color(0xff833ab4),
        Color(0xfffd1d1d),
        Color(0xfffcb045),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ).createShader(outerRect);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
}
