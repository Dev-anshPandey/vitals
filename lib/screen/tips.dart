import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vitals/widget/color.dart';

class Tips extends StatelessWidget {
  final controller = LiquidController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [LiquidSwipe(
              liquidController: controller,
              enableSideReveal: true,
              slideIconWidget: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              pages: [
                Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: mycolor['gradientColor'],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            //    Padding(
                            //      padding: const EdgeInsets.only(bottom:0.0,right: 10),
                            //      child: Text(
                            // "#Tips",
                            //       style: TextStyle(
                            //           color: mycolor['textColor'],
                            //           fontWeight: FontWeight.bold,
                            //           fontSize: 35),
                            //   ),
                            //    ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 0.0),
                              child: FaIcon(
                                FontAwesomeIcons.glassWater,
                                color: Colors.black,
                                size: 55,
                              ),
                            ),
                            //  SizedBox(height: 20,),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 0.0),
                              child: Column(
                                children: [
                                  Text(
                                    "Drink at least 2.7L \n of water per day",
                                    style: TextStyle(
                                        color: mycolor['textColor'],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: 35,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Positioned(
                                        bottom: 190,
                                        left: 140,
                                        child: Icon(Icons.bookmark_border,
                                            color: mycolor['textColor']),
                                      ),
                                      SizedBox(width: 60),
                                      Positioned(
                                        bottom: 190,
                                        left: 140,
                                        child: Icon(Icons.share,
                                            color: mycolor['textColor']),
                                      ),
                                       
                                    ],
                                  ),
                                   SizedBox(height: 50),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
                Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: mycolor['textColor'],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            //    Padding(
                            //      padding: const EdgeInsets.only(bottom:0.0,right: 10),
                            //      child: Text(
                            // "#Tips",
                            //       style: TextStyle(
                            //           color: mycolor['textColor'],
                            //           fontWeight: FontWeight.bold,
                            //           fontSize: 35),
                            //   ),
                            //    ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 0.0),
                              child: FaIcon(
                                FontAwesomeIcons.personWalking,
                                color: Colors.white,
                                size: 55,
                              ),
                            ),
                            //  SizedBox(height: 20,),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 0.0),
                              child: Column(
                                children: [
                                  Text(
                                    "Walk at least 2000 \nsteps per day",
                                    style: TextStyle(
                                        color: mycolor['thirdColor'],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: 35,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Positioned(
                                        bottom: 190,
                                        left: 140,
                                        child: Icon(Icons.bookmark_border,
                                            color: mycolor['thirdColor']),
                                      ),
                                      SizedBox(width: 60),
                                      Positioned(
                                        bottom: 190,
                                        left: 140,
                                        child: Icon(Icons.share,
                                            color: mycolor['thirdColor']),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 50),
                                  
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
              ]),
              Positioned(
                bottom: 40,
                left: 166,
                right: 32,
                child: AnimatedSmoothIndicator(
                                    count: 2,
                                    activeIndex: controller.currentPage,
                                    effect: WormEffect(
                                        activeDotColor: Colors.white,
                                        dotColor: Colors.white54,
                                        spacing: 16),
                                    onDotClicked: ((index) {
                                      controller.animateToPage(page: index);
                                    }),
                                  ),
              )
              ]
        ),
            
      ),
    );
  }
}
