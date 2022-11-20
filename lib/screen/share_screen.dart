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
          padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.02,left:MediaQuery.of(context).size.width*0.05,right: MediaQuery.of(context).size.height*0.01 ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Sharing",
                          style: TextStyle(
                            backgroundColor: mycolor['bgColor'],
                            fontSize: MediaQuery.of(context).size.height * 0.032,
                            letterSpacing: 0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.04,bottom:MediaQuery.of(context).size.height*0.015 ),
                          child: Text(
                            "Sharing with you",
                            style: TextStyle(
                              backgroundColor: mycolor['bgColor'],
                              fontSize: MediaQuery.of(context).size.height * 0.02,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0,
                              
                            ),
                          ),
                        ),
                         Card(
                           child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white
                            ),
                             child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0, left: 8, right: 0, bottom: 4),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                     // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        const CircleAvatar(
                                          radius: 25,
                                          backgroundColor: Colors.black,
                                          child: CircleAvatar(
                                              radius: 70,
                                              backgroundImage: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Elon_Musk_Royal_Society_%28crop2%29.jpg/1200px-Elon_Musk_Royal_Society_%28crop2%29.jpg'),
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
                                          height: 8,
                                        ),
                                            Text(
                                              "Brother",
                                              style: TextStyle(color: mycolor['textColor'], fontWeight: FontWeight.bold,),
                                            ),
                                          SizedBox(
                                          height: 10,
                                        ),
                                            Text(
                                                "Steps - 600",
                                                style:
                                                    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold,)),
                                            SizedBox(
                                          height: 10,
                                        ),
                                          ],
                                        ),
                                          Padding(
                                            padding: EdgeInsets.only(left:MediaQuery.of(context).size.height*0.1,top:MediaQuery.of(context).size.height*0.01 ,right: MediaQuery.of(context).size.height*0.03),
                                            child: Text(
                                                  "8:43",
                                                  style:
                                                      TextStyle(color: Colors.grey, fontWeight: FontWeight.bold,)),
                                          ),
                                        Padding(
                                          padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height*0.01 ),
                                          child: Icon(Icons.arrow_forward_ios,color: Colors.grey,size: MediaQuery.of(context).size.height*0.02,),
                                        )  
                                      ],
                                    ),
                                  ),
                           ),
                         ),
                    Padding(
                      padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height*0.03,bottom: MediaQuery.of(context).size.height*0.03),
                      child: Card(
                        color: mycolor['thirdColor'],
                        child: Padding(
                          padding: const EdgeInsets.only(top:10.0,bottom: 10.0,left:10,),
                          child: Row(
                            children: [
                              Text("Ask someone to share",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,),),
                              SizedBox(width: 180,)
                            ],
                          ),
                          
                        ),
                      ),
                    ),
                    Text(
                            "You are sharing with",
                            style: TextStyle(
                              backgroundColor: mycolor['bgColor'],
                              fontSize: MediaQuery.of(context).size.height * 0.02,
                              letterSpacing: 0,
                               fontWeight: FontWeight.bold,
                              
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top:MediaQuery.of(context).size.width*0.032,),
                            child: Card(
                              color: mycolor['thirdColor'],
                              
                              child: Container(
                                height: MediaQuery.of(context).size.height*0.45,
                                width: MediaQuery.of(context).size.width*0.9,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height*0.02),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.black,
                                        radius: 34,
                                        child: Icon(Icons.group,size: 50,color: mycolor['gradientColor'],)),
                                    ),
                                    SizedBox(height: 20,),
                                     Text(
                            "Health Sharing",
                            style: TextStyle(
                               fontWeight: FontWeight.bold,
                              fontSize: MediaQuery.of(context).size.height * 0.02,
                              letterSpacing: 0,
                              
                            ),
                           
                          ),
                           SizedBox(height: 100,),
                           Padding(
                             padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.14,right: MediaQuery.of(context).size.width*0.03),
                             child: Text("Share your health card with your concerned ones",
                              style: TextStyle(
                                 //fontWeight: FontWeight.bold,
                                fontSize: MediaQuery.of(context).size.height * 0.02,)
                             ),
                           )

                                  ],
                                ),
                              ),
                            ),
                          )
                   
            ],
          ),
        ),
      ),

    );
  }
}