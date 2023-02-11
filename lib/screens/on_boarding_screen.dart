import 'package:flutter/material.dart';
import 'package:nectar/screens/components/rounded_button_component.dart';
import 'package:nectar/screens/log_in_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          buildOnBoardingImageStack(),
          buildOnBoardingButtomColumn(context),
        ],
      ),
    );
  }

  Widget buildOnBoardingImageStack() => Stack(
        children: [
          Image.asset(
            'assets/images/boarding1.jpg',
            fit: BoxFit.cover,
          ),
          Positioned(
              child: Container(
            color: Colors.black.withOpacity(0.5),
          )),
        ],
      );

  Widget buildOnBoardingButtomColumn(BuildContext context) => Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 35,
              height: 35,
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'welcome',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              'to our store',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'get your groceries in as fast as one hour',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            RoundeButtonComponent(
              label: 'Get Started',
              color: const Color(0xff53b175),
              onPressed: (){
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_)=> LogInScreen()),
                );
              },
            ),

          ],
        ),
      );
}
