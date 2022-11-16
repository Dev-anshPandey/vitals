import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vitals/widget/color.dart';

class ShareScreen extends StatelessWidget {
  const ShareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mycolor['bgColor'],
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.04,left:MediaQuery.of(context).size.width*0.05 ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                          "Sharing",
                          style: TextStyle(
                            backgroundColor: mycolor['bgColor'],
                            fontSize: MediaQuery.of(context).size.height * 0.035,
                            letterSpacing: 0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.02),
                          child: Text(
                            "Sharing with you",
                            style: TextStyle(
                              backgroundColor: mycolor['bgColor'],
                              fontSize: MediaQuery.of(context).size.height * 0.02,
                              letterSpacing: 0,
                              
                            ),
                          ),
                        ),
                         Container(
                          decoration: BoxDecoration(
                            color: Colors.white
                          ),
                           child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, left: 8, right: 8, bottom: 4),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const CircleAvatar(
                                        radius: 25,
                                        backgroundColor: Colors.black,
                                        child: CircleAvatar(
                                            radius: 70,
                                            backgroundImage: NetworkImage(
                                                "https://bsmedia.business-standard.com/_media/bs/img/misc/2022-05/26/full/yogi-adityanath-1653561569-18753100.jpg"),
                                            backgroundColor: Colors.white),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children:  [
                                          SizedBox(
                                        height: 10,
                                      ),
                                          Text(
                                            "Brother",
                                            style: TextStyle(color: mycolor['textColor']),
                                          ),
                                        SizedBox(
                                        height: 10,
                                      ),
                                          Text(
                                              "No recent changes",
                                              style:
                                                  TextStyle(color: Colors.grey)),
                                          SizedBox(
                                        height: 10,
                                      ),
                                        ],
                                      ),
                                        Text(
                                              "8:43",
                                              style:
                                                  TextStyle(color: Colors.grey)),
                                        
                                    ],
                                  ),
                                ),
                         ),
            ],
          ),
        ),
      ),

    );
  }
}