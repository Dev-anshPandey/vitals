import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'dart:async';

import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:vitals/widget/color.dart';

String formatDate(DateTime d) {
  return d.toString().substring(0, 19);
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = '?', _steps = '0';
  double a = 0.0;
  Map<String, double> dataMap = {};
  @override
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Map<String, double> pieSteps(double steps) {
    print(steps);
    return dataMap = {
      "Steps": steps,
      "": 2000 - steps,
    };
  }

  void onStepCount(StepCount event) {
    print(event);
    setState(() {
      pieSteps(event.steps.toDouble());
      a = event.steps.toDouble();
      _steps = event.steps.toString();
    });
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    print(event);
    setState(() {
      _status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    print('onPedestrianStatusError: $error');
    setState(() {
      _status = 'Pedestrian Status not available';
    });
    print(_status);
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    setState(() {
      _steps = 'Step Count not available';
    });
  }

  void initPlatformState() async {
    if (await Permission.activityRecognition.request().isGranted) {
      _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
      _pedestrianStatusStream
          .listen(onPedestrianStatusChanged)
          .onError(onPedestrianStatusError);

      _stepCountStream = Pedometer.stepCountStream;
      _stepCountStream.listen(onStepCount).onError(onStepCountError);
    }
    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    String date = DateFormat.MMMMEEEEd().format(DateTime.now());
    return Scaffold(
        backgroundColor: mycolor['bgColor'],
        bottomNavigationBar: bottomNavigation(),
        body: SafeArea(
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
                      backgroundColor: mycolor['bgColor'],
                      fontSize: MediaQuery.of(context).size.height * 0.019,
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
                    backgroundColor: mycolor['bgColor'],
                    fontSize: MediaQuery.of(context).size.height * 0.032,
                    letterSpacing: 0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02,
                    right: MediaQuery.of(context).size.width * 0.025,
                    left: MediaQuery.of(context).size.width * 0.025),
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Steps :",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.02),
                          ),
                          Text(_steps,
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.035,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                      // SizedBox(
                      //   width: 20,
                      // ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.02,
                            bottom: MediaQuery.of(context).size.height * 0.02),
                        child: PieChart(
                          dataMap: pieSteps(a),
                          chartRadius: MediaQuery.of(context).size.width / 2.5,
                          chartType: ChartType.ring,
                          legendOptions:
                              const LegendOptions(showLegends: false),
                          chartValuesOptions: const ChartValuesOptions(
                            showChartValuesInPercentage: true,
                            showChartValuesOutside: true,
                          ),
                          colorList: [Color(0xffE7FE55), Colors.black],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.height * 0.01,
                    top: MediaQuery.of(context).size.height * 0.02),
                child: Text(
                  "Trends",
                  style: TextStyle(
                    backgroundColor: mycolor['bgColor'],
                    fontSize: MediaQuery.of(context).size.height * 0.022,
                    letterSpacing: 0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                children: [
                  Trend(bgColor:mycolor['gradientColor']),
                  Trend(bgColor: mycolor['textColor'],)
                ],
              )
            ],
          ),
        ));
  }
}

class Trend extends StatelessWidget {
  Color? bgColor;
  Trend({this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left:MediaQuery.of(context).size.width*0.02,right:MediaQuery.of(context).size.width*0.07,top: MediaQuery.of(context).size.height*0.02),
      child: Container(
        color: bgColor,
        height: 200,
        width: 160,
      ),
    );
  }
}

class bottomNavigation extends StatefulWidget {
  int index = 0;
  @override
  State<bottomNavigation> createState() => _bottomNavigationState();
}

class _bottomNavigationState extends State<bottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: mycolor['bgColor'],
        onTap: (state) {
          setState(() {
            widget.index = state;
          });
        },
        selectedFontSize: 0,
        unselectedFontSize: 0,
        currentIndex: widget.index,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black,
              size: 30,
            ),
            activeIcon: CircleAvatar(
              child:
                  Icon(Icons.home, color: mycolor['gradientColor'], size: 30),
              backgroundColor: mycolor['textColor'],
              maxRadius: 25,
            ),
            label: "",
            backgroundColor: Color(0xff8BDF85),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.group, color: Colors.black, size: 30),
              activeIcon: CircleAvatar(
                child: Icon(Icons.group,
                    color: mycolor['gradientColor'], size: 30),
                backgroundColor: mycolor['textColor'],
                maxRadius: 25,
              ),
              label: "",
              backgroundColor: Color(0xff8BDF85)),
          // BottomNavigationBarItem(
          //     icon: Icon(
          //       Icons.account_circle,
          //       color: Colors.black,
          //       size: 35,
          //     ),
          //     activeIcon: CircleAvatar(
          //       child:
          //           Icon(Icons.account_circle, color: mycolor['gradientColor'], size: 35),
          //       backgroundColor: mycolor['textColor'],
          //       maxRadius: 25,
          //     ),
          //     label: "",
          //     backgroundColor: Color(0xff8BDF85)),
        ]);
  }
}
