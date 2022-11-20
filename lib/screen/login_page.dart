import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:vitals/widget/color.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top]);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mycolor['bgColor'],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.04,left:MediaQuery.of(context).size.width*0.05 ),
              child: Text(
                          "Login",
                          style: TextStyle(
                            backgroundColor: mycolor['bgColor'],
                            fontSize: MediaQuery.of(context).size.height * 0.035,
                            letterSpacing: 0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
            ),
                     Padding(
                       padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height*0.04),
                       child: LoginCard(),
                     )
          ],
        ),
      ),

    );
  }
}

class LoginCard extends StatefulWidget {
  @override
  State<LoginCard> createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  bool isLoggedIn = false;
  int ls = 1;

  //late GoogleSignInAccount user;

  //GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.white, width: 3),
          boxShadow: const [
            BoxShadow(
              // color: Colors.black,
              blurRadius: 6,

              color: Colors.black26,
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(15))),
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
                    width: MediaQuery.of(context).size.height * 0.17,
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
                          shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
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
                          shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
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
              ),],
          ),
          
        ],
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