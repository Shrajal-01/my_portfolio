import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';

class MainOfMobile extends StatelessWidget {
  const MainOfMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 40.0,
        vertical: 30.0,
      ),
      height: screenHeight,
      constraints: const BoxConstraints(
        minHeight: 560.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Avatar image
          ShaderMask(
            shaderCallback: (bounds) {
              return LinearGradient(colors: [
                CustomColor.scaffoldBg,
                CustomColor.scaffoldBg.withOpacity(0.6),
              ]).createShader(bounds);
            },
            blendMode: BlendMode.srcATop,
            child: Image.asset(
              "assets/my_flutter_image.jpg",
              width: screenWidth,
            ),
          ),
          const SizedBox(height: 30),
          //intro
          const Text(
            "Hi, \nI'm Shrajal \nA Flutter Developer",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 15),
          //contact btn
          SizedBox(
            width: 200.0,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text(
                "Get in touch",
                style: TextStyle(
                  color: CustomColor.yellowSecondary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
    ;
  }
}
