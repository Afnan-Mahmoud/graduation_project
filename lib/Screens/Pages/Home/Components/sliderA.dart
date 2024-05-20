import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderA extends StatefulWidget {
  const SliderA({Key? key}) : super(key: key);
  @override
  State<SliderA> createState() => _SliderAState();
}
class _SliderAState extends State<SliderA> {
  final List<Image> myItems = [
    Image.asset(
      "lib/assets/images/img1.jpg",
      fit: BoxFit.cover,
      width: double.infinity, // Ensure image width fills the page
    ),
    Image.asset(
      "lib/assets/images/img5.jpeg",
      fit: BoxFit.cover,
      width: double.infinity, // Ensure image width fills the page
    ),
    Image.asset(
      "lib/assets/images/benign.png",
      fit: BoxFit.cover,
      width: double.infinity, // Ensure image width fills the page
    ),
    Image.asset(
      "lib/assets/images/img2.jpg",
      fit: BoxFit.cover,
      width: double.infinity, // Ensure image width fills the page
    ),
    Image.asset(
      "lib/assets/images/img4.jpg",
      fit: BoxFit.cover,
      width: double.infinity, // Ensure image width fills the page
    ),
  ];
  int myCurrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 0,left: 0,right: 0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                height: 220,
                viewportFraction: 1.0, // Set viewportFraction to 1.0 for full width
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(microseconds: 100),
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    myCurrentIndex = index;
                  });
                },
              ),
              items: myItems.map((item) => item).toList(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 0),
              child: AnimatedSmoothIndicator(
                activeIndex: myCurrentIndex,
                count: myItems.length,
                effect: WormEffect(
                  dotHeight: 8,
                  dotWidth: 8,
                  spacing: 7,
                  dotColor: Colors.grey.shade200,
                  activeDotColor: Colors.grey.shade400,
                  paintStyle: PaintingStyle.fill,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}