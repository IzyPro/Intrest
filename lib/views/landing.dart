import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intrests/styles/app_colors.dart';
import 'package:intrests/utils/const.dart';
import 'package:intrests/utils/router.dart';
import 'package:intrests/views/widgets/button.dart';

class SpritePainter extends CustomPainter {
  final Animation<double> _animation;

  SpritePainter(this._animation) : super(repaint: _animation);

  void circle(Canvas canvas, Rect rect, double value) {
    double opacity = (1.0 - (value / 4.0)).clamp(0.0, 1.0);
    Color color = AppColors.primary.withOpacity(opacity);

    double size = rect.width / 1.2;
    double area = size * size;
    double radius = sqrt(area * value / 4);

    final Paint paint = Paint()..color = color;
    canvas.drawCircle(rect.center, radius, paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromLTRB(0.0, 0.0, size.width, size.height);

    for (int wave = 3; wave >= 0; wave--) {
      circle(canvas, rect, wave + _animation.value);
    }
  }

  @override
  bool shouldRepaint(SpritePainter oldDelegate) {
    return true;
  }
}

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  LandingState createState() => LandingState();
}

class LandingState extends State<Landing> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation() {
    _controller
      ..stop()
      ..reset()
      ..repeat(period: const Duration(seconds: 1));
  }

  void _stopAnimation() {
    _controller.stop();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).dialogBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.only(
              left: generalHorizontalPadding,
              top: topSpace,
              right: generalHorizontalPadding),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WordsButton(
                  press: () {},
                  firstText: 'Int',
                  secondText: 'rests',
                  secondTextColor: Theme.of(context).primaryColor,
                  textStyle: Theme.of(context)
                      .primaryTextTheme
                      .headline1
                      ?.copyWith(fontSize: 40, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: topSpace + topSpace,
                ),
                Stack(
                  children: [
                    CustomPaint(
                      painter: SpritePainter(_controller),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width * 0.6,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Let's\nfind your\ninterests",
                          style: Theme.of(context)
                              .primaryTextTheme
                              .headline1!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic),
                        ),
                        const SizedBox(
                          height: ySpace1,
                        ),
                        Text(
                          'Be faithful to your own taste, because\nnothing you really like is ever out of style',
                          style: Theme.of(context).primaryTextTheme.headline4,
                        ),
                        const SizedBox(
                          height: ySpace1,
                        ),
                        GestureDetector(
                          child: Icon(
                            Icons.arrow_right_alt_sharp,
                            size: 60,
                            color: Theme.of(context).canvasColor,
                          ),
                          onTap: () async {
                            _startAnimation();
                            await Future.delayed(
                                const Duration(seconds: 2),
                                () => Navigator.of(context)
                                    .pushNamed(Routes.home));
                            _stopAnimation();
                          },
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
