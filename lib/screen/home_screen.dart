import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vitals/pages/edit_profile.dart';
import 'package:vitals/pages/settings.dart';
import 'package:vitals/provider/bottom_provider.dart';
import 'package:vitals/provider/user_provider.dart';
import 'package:vitals/screen/form.dart';
import 'package:vitals/screen/share_screen.dart';
import 'package:vitals/screen/tips.dart';
import 'package:vitals/widget/color.dart';

String formatDate(DateTime d) {
  return d.toString().substring(0, 19);
}

List<Widget> displayScreen = [HomeWidget(), ShareScreen(), SettingsPage()];
openUrl() async {
  var url = Uri.parse("https://myherokuyoga.herokuapp.com/");
  if (await canLaunchUrl(url)) {
    await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
    );
  } else {
    throw 'Could not launch $url';
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<BottomProvider>(
            create: ((context) => BottomProvider()),
          ),
        ],
        child: Scaffold(
          body: Consumer<BottomProvider>(
            builder: (context, value, child) {
              return displayScreen[value.bottomNo];
            },
          ),
          bottomNavigationBar: bottomNavigation(),
        ));
  }
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  var auth = FirebaseAuth.instance;
  var loggedIn = false;
  checkIfLogIn() async {
    final user = Provider.of<UserProvider>(context, listen: false);
     user.setUrl(auth.currentUser!.photoURL.toString());
    auth.authStateChanges().listen((User? user) {   
      if (user != null && mounted) {
        setState(() {
          loggedIn = true;
        });
      }
    });
  }

  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = '?', _steps = '0';
  double a = 0.0;
  double b = 0.0;
  Map<String, double> dataMap = {};
  @override
  @override
  void initState() {
    checkIfLogIn();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top]);
    super.initState();
    initPlatformState();
  }

  Map<String, double> pieSteps(double steps) {
    print(steps);
    return dataMap = {
      "Steps": steps,
    };
  }

  void onStepCount(StepCount event) {
    print(event);
    setState(() {
      pieSteps(event.steps.toDouble());
      a = event.steps.toDouble();
      b = 43.72 * (a / 67.5);
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
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
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
                        fontSize: MediaQuery.of(context).size.height * 0.016,
                        letterSpacing: 0.4),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.height * 0.01,
                      top: MediaQuery.of(context).size.height * 0.002),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Summary",
                        style: TextStyle(
                          backgroundColor: mycolor['bgColor'],
                          fontSize: MediaQuery.of(context).size.height * 0.032,
                          letterSpacing: 0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Consumer<UserProvider>(
                        builder: (context, value, child) {
                          return value.url == null
                              ? const Padding(
                                  padding: EdgeInsets.only(right: 8.0),
                                  child: Icon(
                                    Icons.account_circle,
                                    color: Colors.black,
                                    size: 40,
                                  ),
                                )
                              : Padding(
                                  padding: EdgeInsets.only(right: 8.0),
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(value.url!),
                                  ));
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.02,
                      right: MediaQuery.of(context).size.width * 0.025,
                      left: MediaQuery.of(context).size.width * 0.025),
                  child: Card(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.025),
                              child: Text(
                                "Steps :",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.02),
                              ),
                            ),
                            Text(_steps,
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.035,
                                    fontWeight: FontWeight.bold)),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.03),
                              child: Text(
                                "Kcal :",
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                              ),
                            ),
                            Text(b.toInt().toString(),
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.035,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                        // SizedBox(
                        //   width: 20,
                        // ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.02,
                              bottom:
                                  MediaQuery.of(context).size.height * 0.02),
                          child: GestureDetector(
                            onTap: () {
                              HapticFeedback.mediumImpact();
                            },
                            child: PieChart(
                              dataMap: pieSteps(a),
                              ringStrokeWidth: 27,
                              chartRadius:
                                  MediaQuery.of(context).size.width / 2.5,
                              chartType: ChartType.ring,
                              totalValue: 1500,
                              initialAngleInDegree: -90,
                              legendOptions:
                                  const LegendOptions(showLegends: false),
                              chartValuesOptions: const ChartValuesOptions(
                                showChartValuesInPercentage: true,
                                showChartValuesOutside: true,
                              ),
                              baseChartColor: Colors.black,
                              colorList: [Color(0xffE7FE55), Colors.black],
                            ),
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
                    "Tips",
                    style: TextStyle(
                      backgroundColor: mycolor['bgColor'],
                      fontSize: MediaQuery.of(context).size.height * 0.022,
                      letterSpacing: 0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Trend(
                        bgColor: mycolor['gradientColor'],
                        fontColor: Colors.black,
                        icon: FaIcon(
                          FontAwesomeIcons.glassWater,
                          color: Colors.black,
                          size: 45,
                        ),
                        detail: "Drink at least 2.7L of water per day",
                      ),
                      Trend(
                        bgColor: mycolor['textColor'],
                        fontColor: mycolor['thirdColor'],
                        icon: FaIcon(
                          FontAwesomeIcons.personWalking,
                          color: mycolor['thirdColor'],
                          size: 45,
                        ),
                        detail: "Walk at least 2000 steps per day",
                      ),
                      Trend(
                        bgColor: mycolor['gradientColor'],
                        fontColor: Colors.black,
                        icon: FaIcon(
                          FontAwesomeIcons.glassWater,
                          color: Colors.black,
                          size: 45,
                        ),
                        detail: "Drink at least 2.7L of water per day",
                      ),
                      Trend(
                        bgColor: mycolor['textColor'],
                        fontColor: mycolor['thirdColor'],
                        icon: FaIcon(
                          FontAwesomeIcons.personWalking,
                          color: mycolor['thirdColor'],
                          size: 45,
                        ),
                        detail: "Walk at least 2000 steps per day",
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.height * 0.01,
                      top: MediaQuery.of(context).size.height * 0.03),
                  child: Text(
                    "Exercise",
                    style: TextStyle(
                      backgroundColor: mycolor['bgColor'],
                      fontSize: MediaQuery.of(context).size.height * 0.022,
                      letterSpacing: 0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.02,
                      left: MediaQuery.of(context).size.height * 0.01,
                      right: MediaQuery.of(context).size.height * 0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/form');
                    },
                    child: Card(
                      color: mycolor['thirdColor'],
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Sign Up",
                                    style: TextStyle(
                                        color: mycolor['textColor'],
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.033,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0)),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.login,
                                  size: 22,
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.037,
                                  bottom: MediaQuery.of(context).size.height *
                                      0.015,
                                  left:
                                      MediaQuery.of(context).size.height * 0.05,
                                  right: MediaQuery.of(context).size.height *
                                      0.065),
                              child: Text("To get personalized exercise",
                                  style: TextStyle(
                                      color: mycolor['textColor'],
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class Trend extends StatefulWidget {
  Color? bgColor;
  Color? fontColor;
  Widget? icon;
  String? detail;
  Trend({this.bgColor, this.fontColor, this.icon, this.detail});

  @override
  State<Trend> createState() => _TrendState();
}

class _TrendState extends State<Trend> {
  int status = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.022,
              right: MediaQuery.of(context).size.width * 0.045,
              top: MediaQuery.of(context).size.height * 0.02),
          child: GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: ((context) {
                    return FractionallySizedBox(
                      heightFactor: 1,
                      child: Tips(),
                    );
                  }));
            },
            child: Container(
                height: 200,
                width: 160,
                decoration: BoxDecoration(
                    color: widget.bgColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.034,
                    right: MediaQuery.of(context).size.width * 0.01,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      widget.icon!,
                      //  SizedBox(height: 20,),
                      Text(
                        widget.detail!,
                        style: TextStyle(
                            color: widget.fontColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ],
                  ),
                )),
          ),
        ),
        status == 0
            ? Positioned(
                top: 190,
                left: 140,
                child: GestureDetector(
                  onTap: () {
                    Fluttertoast.showToast(
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                        msg: "Saved");
                    setState(() {
                      status = 1;
                    });
                  },
                  child: Icon(Icons.bookmark_border, color: widget.fontColor),
                ),
              )
            : Positioned(
                top: 190,
                left: 140,
                child: GestureDetector(
                  onTap: () {
                    Fluttertoast.showToast(
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                        msg: "Unsaved");
                    setState(() {
                      status = 0;
                    });
                  },
                  child: Icon(Icons.bookmark, color: widget.fontColor),
                ),
              )
      ],
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
    return Consumer<BottomProvider>(
      builder: ((context, value, child) {
        final bno = Provider.of<BottomProvider>(context, listen: false);
        return BottomNavigationBar(
            backgroundColor: mycolor['bgColor'],
            onTap: (state) {
              setState(() {
                bno.setBNo(state);
                //  widget.index = state;
              });
            },
            selectedFontSize: 0,
            unselectedFontSize: 0,
            currentIndex: value.bottomNo,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.black,
                  size: 30,
                ),
                activeIcon: CircleAvatar(
                  child: Icon(Icons.favorite,
                      color: mycolor['gradientColor'], size: 30),
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
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                    color: Colors.black,
                    size: 35,
                  ),
                  activeIcon: CircleAvatar(
                    child: Icon(Icons.settings,
                        color: mycolor['gradientColor'], size: 35),
                    backgroundColor: mycolor['textColor'],
                    maxRadius: 25,
                  ),
                  label: "",
                  backgroundColor: Color(0xff8BDF85)),
            ]);
      }),
    );
  }
}
