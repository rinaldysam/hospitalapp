import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeSkeletonView extends StatefulWidget {
  final Duration fadeInDuration;
  final Duration fadeOutDuration;

  const HomeSkeletonView({
    Key? key,
    this.fadeInDuration = const Duration(milliseconds: 500),
    this.fadeOutDuration = const Duration(milliseconds: 500),
  }) : super(key: key);

  @override
  HomeSkeletonState createState() => HomeSkeletonState();
}

class HomeSkeletonState extends State<HomeSkeletonView> {
  bool _visible = true;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() {
    Future.delayed(widget.fadeInDuration + widget.fadeOutDuration, () {
      if (mounted) {
        setState(() {
          _visible = !_visible;
        });
        _startAnimation();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _visible ? 0.8 : 0.2,
      duration: _visible ? widget.fadeInDuration : widget.fadeOutDuration,
      child: Column(
        children: [
          _cardsList().paddingOnly(top: 8, left: 16, right: 16),
          const SizedBox(height: 16),
          SizedBox(
            height: 72,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Container(
                    decoration: _boxGrey(borderRadius: 8),
                    height: 30,
                    width: 240),
                const SizedBox(width: 8),
                Container(
                    decoration: _boxGrey(borderRadius: 8),
                    height: 30,
                    width: 240),
                const SizedBox(width: 8),
                Container(
                    decoration: _boxGrey(borderRadius: 8),
                    height: 30,
                    width: 240),
              ],
            ),
          ).paddingOnly(left: 16, right: 0),
          const SizedBox(height: 8),
          _cardsList().paddingOnly(top: 8, left: 16, right: 16),
        ],
      ),
    );
  }

  BoxDecoration _boxGrey({double borderRadius = 4}) {
    return BoxDecoration(
      color: Colors.black12,
      borderRadius: BorderRadius.circular(borderRadius),
    );
  }

  Widget _cardsList() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(decoration: _boxGrey(), height: 20, width: 128),
            Container(decoration: _boxGrey(), height: 20, width: 64),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Container(decoration: _boxGrey(), height: 30, width: 72),
            const SizedBox(width: 8),
            Container(decoration: _boxGrey(), height: 30, width: 72),
            const SizedBox(width: 8),
            Container(decoration: _boxGrey(), height: 30, width: 72),
            const SizedBox(width: 8),
            Container(decoration: _boxGrey(), height: 30, width: 72),
            const Spacer()
          ],
        ),
        const SizedBox(height: 20),
        Container(decoration: _boxGrey(borderRadius: 8), height: 72),
        const SizedBox(height: 8),
        Container(decoration: _boxGrey(borderRadius: 8), height: 72),
        const SizedBox(height: 8),
        Container(decoration: _boxGrey(borderRadius: 8), height: 72),
      ],
    );
  }
}
