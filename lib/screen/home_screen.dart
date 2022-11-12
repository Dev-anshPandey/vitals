import 'dart:ui';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:vitals/widget/DashBoardCard.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';

double x = 0.0;
double y = 0.0;
double z = 0.0;
double addValue = 0.025;
int steps = 0;
double previousDistacne = 0.0;
double distance = 0.0;

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    String date = DateFormat.MMMMEEEEd().format(DateTime.now());
    return Scaffold(
      backgroundColor: Color(0xffF3F2E9),
      body: StreamBuilder<AccelerometerEvent>(
          stream: SensorsPlatform.instance.accelerometerEvents,
          builder: (context, snapShort) {
            if (snapShort.hasData) {
              x = snapShort.data!.x;
              y = snapShort.data!.y;
              z = snapShort.data!.z;
              distance = getValue(x, y, z);
              if (distance > 20) {
                steps++;
              }
            }
            return SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.height * 0.01,
                        top: MediaQuery.of(context).size.height * 0.01),
                    child: Text(
                      date,
                      style: TextStyle(
                          backgroundColor: Color(0xffF3F2E9),
                          fontSize: MediaQuery.of(context).size.height * 0.017,
                          letterSpacing: 0.4),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.height * 0.01,
                        top: MediaQuery.of(context).size.height * 0.02),
                    child: Text(
                      "Summary",
                      style: TextStyle(
                        backgroundColor: Color(0xffF3F2E9),
                        fontSize: MediaQuery.of(context).size.height * 0.032,
                        letterSpacing: 0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  dashboardCard(steps)
                ],
              ),
            );
          }),
    );
  }

  double getValue(double x, double y, double z) {
    double magnitude = sqrt(x * x + y * y + z * z);
    getPreviousValue();
    double modDistance = magnitude - previousDistacne;
    setPreviousValue(magnitude);
    return modDistance;
  }

  void setPreviousValue(double distance) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setDouble("preValue", distance);
  }

  void getPreviousValue() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    setState(() {
      previousDistacne = _pref.getDouble("preValue") ?? 0.0;
    });
  }
}
