import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class dashboardCard extends StatelessWidget {
  int steps;
  dashboardCard(this.steps, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: const Color(0xffF3F2E9),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Container(
                  child: Column(
                    children: [
                      // this is for the count in foot step and edit button
                      Container(
                        width: 150,
                        child: Row(
                          children: [
                            Text(
                              steps.toString(),
                              style:
                                  TextStyle(fontSize: 30, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      // this is for the pause button
                      // this is the botton image
                    ],
                  ),
                ),
              ],
            ),
          ),

          // this is botton part
        ],
      ),
    );
  }
}
