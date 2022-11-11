import 'dart:ui';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String date=DateFormat.MMMMEEEEd().format(DateTime.now());
    return Scaffold(
      backgroundColor: Color(0xffF3F2E9),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.only(left:MediaQuery.of(context).size.height*0.01,top: MediaQuery.of(context).size.height*0.01 ),
              child: Text(
                date,
                style: TextStyle(backgroundColor: Color(0xffF3F2E9), fontSize: MediaQuery.of(context).size.height*0.017
                ,letterSpacing: 0.4
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left:MediaQuery.of(context).size.height*0.01,top: MediaQuery.of(context).size.height*0.02 ),
              child: Text(
                "Summary",
                style: TextStyle(backgroundColor: Color(0xffF3F2E9), fontSize: MediaQuery.of(context).size.height*0.032
                ,letterSpacing: 0,
                fontWeight: FontWeight.bold,
                
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
