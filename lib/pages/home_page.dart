import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> wallpapers = [
    'assets/images/1.jpg',
    'assets/images/2.jpg',
    'assets/images/3.jpg',
    'assets/images/4.jpg',
    'assets/images/5.jpg',
  ];

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
        child: Column(
          children: [
            Row(
              children: [
                Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(60),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: Image.asset(
                        'assets/images/man.jpg',
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      )),
                ),
                const SizedBox(width: 40.0),
                Text(
                  'MY WALLS',
                  style: GoogleFonts.poppins(
                    fontSize: 28.0,
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30.0),
            CarouselSlider.builder(
              itemCount: wallpapers.length,
              itemBuilder: (context, index, realIndex) {
                final res = wallpapers[index];
                return buildImage(
                  res,
                  index,
                );
              },
              options: CarouselOptions(
                  height: MediaQuery.of(context).size.height / 1.5,
                  //viewportFraction: 1, //How you wanna show the pictures or content.
                  enlargeCenterPage: true,
                  autoPlay: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  onPageChanged: (index, reason) {
                    setState(() {
                      activeIndex = index;
                    });
                  }),
            ),
            const SizedBox(height: 20),
            animatedIndicator(),
          ],
        ),
      ),
    );
  }

  //indicator method
  Widget animatedIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: wallpapers.length,
      effect: const JumpingDotEffect(
        dotWidth: 12,
        dotHeight: 12,
        activeDotColor: Colors.black,
      ),
    );
  }

  //Carousel content method
  Widget buildImage(String url, int index) {
    return Container(
      margin: const EdgeInsets.only(right: 10.0),
      height: MediaQuery.of(context).size.height / 1.5,
      width: MediaQuery.of(context).size.width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image.asset(
          url,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
