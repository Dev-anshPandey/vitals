import 'package:flutter/material.dart';
import 'package:vitals/widget/color.dart';

class Forms extends StatefulWidget {
  @override
  State<Forms> createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    List<Step> getStep = [
      Step(
          state: _currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: _currentStep >= 0,
          title: Text("Nick Name"),
          content: FormNN()),
      Step(
          state: _currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: _currentStep >= 1,
          title: Text("Details"),
          content: FormD()),
      Step(
          state: _currentStep > 2 ? StepState.complete : StepState.indexed,
          isActive: _currentStep >= 2,
          title: Text("Sign Up"),
          content: FormL())
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: mycolor['bgColor'],
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Theme(
                    data: Theme.of(context).copyWith(
                        colorScheme:
                            ColorScheme.light(primary: mycolor['textColor']!)),
                    child: Stepper(
                        onStepTapped: ((value) {
                          setState(() {
                            _currentStep = value;
                          });
                        }),
                        steps: getStep,
                        currentStep: _currentStep,
                        onStepContinue: () {
                          setState(() {
                            if (_currentStep == getStep.length - 1) {
                              // code on form submission

                            } else {
                              _currentStep++;
                            }
                          });
                        },
                        onStepCancel: () {
                          setState(() {
                            _currentStep != 0 ? _currentStep-- : null;
                          });
                        },
                        type: StepperType.horizontal),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class FormNN extends StatelessWidget {
  const FormNN({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.04,
          bottom: MediaQuery.of(context).size.height * 0.04),
      child: Card(
          child: Container(
        color: Colors.white,
        child: Form(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.03),
                child: Text("Nick Name : ",
                    style: TextStyle(
                        color: mycolor['textColor'],
                        fontSize: MediaQuery.of(context).size.height * 0.027,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0)),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.04,
                    right: MediaQuery.of(context).size.width * 0.04,
                    bottom: MediaQuery.of(context).size.height * 0.02),
                child: TextFormField(
                  validator: ((value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Something';
                    }
                  }),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}

class FormD extends StatefulWidget {
  const FormD({
    Key? key,
  }) : super(key: key);

  @override
  State<FormD> createState() => _FormDState();
}

double currValue = 20;
double height = 150;
double weight = 50;

class _FormDState extends State<FormD> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.02,
          bottom: MediaQuery.of(context).size.height * 0.04),
      child: Card(
          child: Container(
        color: Colors.white,
        child: Form(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.03,
                    left: MediaQuery.of(context).size.width * 0.06,
                    bottom: MediaQuery.of(context).size.height * 0.01
                    ),
                child: Row(
                  children: [
                    Text("Gender : ",
                        style: TextStyle(
                            color: mycolor['textColor'],
                            fontSize:
                                MediaQuery.of(context).size.height * 0.027,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0)),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                    Card(
                        child: Icon(
                      Icons.man,
                      size: 28,
                    )),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.08,
                    ),
                    Card(child: Icon(Icons.woman_outlined, size: 28))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.03,
                    bottom: MediaQuery.of(context).size.height * 0.01,
                    left: MediaQuery.of(context).size.width * 0.06),
                child: Row(
                  children: [
                    Text("Age : ",
                        style: TextStyle(
                            color: mycolor['textColor'],
                            fontSize:
                                MediaQuery.of(context).size.height * 0.027,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0)),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.07,
                    ),
                    Slider(
                      value: currValue,
                      onChanged: (value) {
                        setState(() {
                          currValue = value;
                        });
                      },
                      min: 10,
                      max: 80,
                      label: currValue.round().toString(),
                      divisions: 80,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.03,
                    bottom: MediaQuery.of(context).size.height * 0.01,
                    left: MediaQuery.of(context).size.width * 0.06),
                child: Row(
                  children: [
                    Text("Height : ",
                        style: TextStyle(
                            color: mycolor['textColor'],
                            fontSize:
                                MediaQuery.of(context).size.height * 0.027,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0)),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0,
                    ),
                    Slider(
                      value: height,
                      onChanged: (value) {
                        setState(() {
                          height = value;
                        });
                      },
                      min: 130,
                      max: 200,
                      label: height.round().toString(),
                      divisions: 80,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.03,
                    bottom: MediaQuery.of(context).size.height * 0.03,
                    left: MediaQuery.of(context).size.width * 0.06),
                child: Row(
                  children: [
                    Text("Weight : ",
                        style: TextStyle(
                            color: mycolor['textColor'],
                            fontSize:
                                MediaQuery.of(context).size.height * 0.027,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0)),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0,
                    ),
                    Slider(
                      value: weight,
                      onChanged: (value) {
                        setState(() {
                          weight = value;
                        });
                      },
                      min: 30,
                      max: 120,
                      label: weight.round().toString(),
                      divisions: 90,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

class FormL extends StatefulWidget {
  const FormL({
    Key? key,
  }) : super(key: key);

  @override
  State<FormL> createState() => _FormLState();
}

int ls = 0;

class _FormLState extends State<FormL> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:20.0),
      child: Card(
        child: Container(
          margin: EdgeInsets.only(left: 0, right: 0, ),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.60,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 35, left: 32, right: 0),
                        height: MediaQuery.of(context).size.height * 0.055,
                        width: MediaQuery.of(context).size.height * 0.155,
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              ls = 1;
                            });
                          },
                          child: ls == 1
                              ? const Text(
                                  "Log In",
                                  style: TextStyle(color: Colors.white),
                                )
                              : const Text(
                                  "Log In",
                                  style: TextStyle(color: Colors.black),
                                ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  ls == 1 ? Colors.black : Colors.white),
                              shape:
                                  MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(18.0),
                                          side: BorderSide(color: Colors.white)))),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 35, left: 0, right: 35),
                        height: MediaQuery.of(context).size.height * 0.055,
                        width: MediaQuery.of(context).size.height * 0.15,
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              ls = 0;
                            });
                          },
                          child: ls == 1
                              ? const Text(
                                  "Sign Up",
                                  style: TextStyle(color: Colors.black),
                                )
                              : const Text(
                                  "Sign Up",
                                  style: TextStyle(color: Colors.white),
                                ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  ls == 1 ? Colors.white : Colors.black),
                              shape:
                                  MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(18.0),
                                          side: BorderSide(color: Colors.white)))),
                        ),
                      ),
                    ],
                  ),
                  TextFieldToDisplay(ls),
                  const SizedBox(
                    height: 30,
                  ),
                  const Center(
                      child: Text(
                    "OR",
                    style: TextStyle(color: Colors.grey),
                  )),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60),
                        ),
                        elevation: 2,
                        child: const CircleAvatar(
                          maxRadius: 21,
                          backgroundImage: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRifhBwWgV_xNLjFzJFkzg1XExdYGqAwxHKEw&usqp=CAU",
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            // googleSignIn.signIn().then((value) {
                            //   setState(() {
                            //     if (value != Null) {
      
                            //       user = value!;
                            //       //  Provider.of<MyList>(context,listen:false).adding(tf);
                            //      Provider.of<LoggedInUser>(context,listen: false).LoggedInUserDetail(link: Image.network(user.photoUrl.toString()) );
                            //        //print(value);
                            //       isLoggedIn = true;
                            //     Navigator.pushNamed(context, 'homeScreen');
                            //       Fire(value);
                            //     }
                            //   });
                            // }).catchError((e) {
                            //   print(e);
                            // });
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(60),
                            ),
                            elevation: 2,
                            child: const CircleAvatar(
                              maxRadius: 21,
                              backgroundImage: NetworkImage(
                                "https://pbs.twimg.com/profile_images/1455185376876826625/s1AjSxph_400x400.jpg",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(
                  //   height: MediaQuery.of(context).size.height * 0.05,
                  // ),
                  // GestureDetector(
                  //   onTap: () {
                  //     Navigator.pushNamed(context, '/homeScreen');
                  //   },
                  //   child: Container(
                  //       margin: EdgeInsets.only(right: 0, left: 180),
                  //       child: const Text(
                  //         "Skip For Now",
                  //         style: TextStyle(
                  //             color: Colors.blue,
                  //             fontSize: 18,
                  //             //fontWeight: FontWeight.bold,
                  //             decoration: TextDecoration.underline),
                  //       )),
                  // )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextFieldToDisplay extends StatelessWidget {
  int ls;
  TextFieldToDisplay(this.ls);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 35, right: 35, top: 45),
          child: TextField(
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 0),
                prefixIcon: Icon(Icons.email),
                labelText: 'Enter your Email'),
            onTap: () {},
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 35, right: 35, top: 35),
          child: TextField(
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 0),
                prefixIcon: Icon(Icons.remove_red_eye),
                labelText: 'Password'),
            onTap: () {},
            obscureText: true,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 60, left: 35, right: 35),
          height: MediaQuery.of(context).size.height * 0.055,
          width: MediaQuery.of(context).size.height * 0.57,
          child: ElevatedButton(
            onPressed: () {
              print("hari bol");
            },
            child: ls == 1 ? Text("Log In") : Text("Sign Up"),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.black)))),
          ),
        ),
      ],
    );
  }
}
