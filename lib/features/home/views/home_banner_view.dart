import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeBannerView extends StatelessWidget {
  const HomeBannerView({
    super.key,
    this.onTapAll,
  });

  final VoidCallback? onTapAll;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 72,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: 3,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {},
                child: _renderCard(),
              );
            },
          ),
        ).marginSymmetric(vertical: 8),
      ],
    );
  }

  Widget _renderCard() {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          radius: 5,
          center: Alignment.topRight,
          colors: [
            Colors.blueAccent.shade200,
            Colors.blueAccent.shade700,
            Colors.blueAccent.shade700,
          ],
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      width: 240,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.only(right: 8),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lorem Ipsum',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'dolor sit amet, consectetur adipiscing elit.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}
