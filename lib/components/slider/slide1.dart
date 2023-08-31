import 'package:flutter/material.dart';

class Slide1 extends StatelessWidget {
  const Slide1({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      widthFactor: 1.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Image.asset(
          'lib/assets/playstore.png',
          width: 250,
        ),
      ),
    );
  }
}

class Slide2 extends StatelessWidget {
  const Slide2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Color(0xFF5423bb),
          Color(0xFF5423bb),
          Color(0xFF5423bb),
          Color(0xFF5423bb),
          Color(0xFF8629b1),
          Color.fromARGB(255, 255, 4, 180),
        ], // Specify your gradient colors here
        begin: Alignment.topLeft,
        end: Alignment.bottomCenter,
        tileMode: TileMode.clamp, // Set the tile mode
        transform: GradientRotation(0.0),
      )),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Image.asset(
              'lib/assets/onboard_hand.png',
              width: 250,
            ),
          ),
          const Text(
            "Payment Made Easy",
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Text(
            'Pay all your bills at once, without leaving your home with Sharpman PayPoint comprehensive range of services',
            style: TextStyle(
              color: Colors.white,
            ),
            softWrap: true,
            textAlign: TextAlign.center,
          )
        ],
      )),
    );
  }
}

class Slide3 extends StatelessWidget {
  const Slide3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Color.fromARGB(255, 255, 4, 180),
          Color.fromARGB(255, 255, 4, 180),
          // Color(0xFF8629b1),
          Color(0xFF5423bb)
        ], // Specify your gradient colors here
        begin: Alignment.topLeft,
        end: Alignment.bottomCenter,
        tileMode: TileMode.clamp, // Set the tile mode
        transform: GradientRotation(0.0),
      )),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Image.asset(
              'lib/assets/onboarding3.png',
              width: 250,
            ),
          ),
          Text(
            "Freedom to do it your way",
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            'Fully | Secured | Reliable | Fast',
            style: TextStyle(
              color: Colors.white,
            ),
            softWrap: true,
            textAlign: TextAlign.center,
          )
        ],
      )),
    );
  }
}
