import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';

class CarouselWithWidth extends StatefulWidget {
  const CarouselWithWidth({
    super.key,
  });

  @override
  State<StatefulWidget> createState() {
    return _CarouselWithWidthState();
  }
}

class _CarouselWithWidthState extends State<CarouselWithWidth> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  final list = [
    Container(
      // width: 298,
      height: 400,
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.white,
          offset: Offset(
            5.0,
            5.0,
          ),
          blurRadius: 10.0,
          spreadRadius: 10.0,
        ),
      ]),
      child: const Center(child: Text('Image 5')),
    ),
    Container(
      // width: 298,
      height: 400,
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.white,
          offset: Offset(
            5.0,
            5.0,
          ),
          blurRadius: 10.0,
          spreadRadius: 10.0,
        ),
      ]),
      child: const SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Weight',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            Center(
              child: Expanded(
                child: SizedBox(
                  // width: 600, // Example width, adjust as needed
                  height: 400, // Example height, adjust as needed
                  // child: DiagramWithStackArea(),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CarouselSlider(
            items: list,
            carouselController: _controller,
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: list.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 12.0,
                  height: 12.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
