import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:vitals/widget/color.dart';

class Tips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LiquidSwipe(
          enableSideReveal: true,
          slideIconWidget: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          pages: [
          
          Container(
            color: mycolor['gradientColor'],
          ),
           Container(
            color: mycolor['textColor'],
          )
        ]),
      ),
    );
  }
}
