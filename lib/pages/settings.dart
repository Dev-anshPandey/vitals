import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vitals/screen/clinical_document.dart';
import 'package:vitals/widget/color.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mycolor['bgColor'],
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            Text(
              "Settings",
              style: TextStyle(
                backgroundColor: mycolor['bgColor'],
                fontSize: MediaQuery.of(context).size.height * 0.032,
                letterSpacing: 0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            buildAccountOptionRow(context, "Clinical Documents"),
            buildAccountOptionRow(context, "Health Details"),
            buildAccountOptionRow(context, "Medical ID"),
            SizedBox(
              height: 60,
            ),
            Row(
              children: [
                Text(
                  "Features",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 0,
            ),
            Abc(icon: Icons.favorite, text: "Heart",color:Colors.red),
            Abc(icon: Icons.female, text: "Cycle Tracking",color:Colors.red),
             Abc(icon: Icons.bed, text: "Sleep",color:Colors.blue),
              Abc(icon: Icons.medical_services_outlined, text: "Medications",color:Colors.green),
               Abc(icon: Icons.add, text: "Other Data",color:Colors.blue),
               
           // buildAccountOptionRow(context, "Health Checklist"),
            //buildAccountOptionRow(context, "Notifications"),

            SizedBox(
              height: 60,
            ),
            // Row(
            //   children: [
            //     Text(
            //       "Privacy",
            //       style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            //     ),
            //   ],
            // ),
            // Divider(
            //   height: 15,
            //   thickness: 2,
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // buildAccountOptionRow(context, "Apps"),
            // buildAccountOptionRow(context, "Research Studies"),
            // buildAccountOptionRow(context, "Devices"),

            // SizedBox(
            //   height: 50,
            // ),
            // Center(
            //   child: ElevatedButton(
            //    // padding: EdgeInsets.symmetric(horizontal: 40),
            //    // shape: RoundedRectangleBorder(
            //     //    borderRadius: BorderRadius.circular(20)),
            //     onPressed: () {},
            //     child: Text("SIGN OUT",
            //         style: TextStyle(
            //             fontSize: 16, letterSpacing: 2.2, color: Colors.black)),
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  Row buildNotificationOptionRow(String title, bool isActive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600]),
        ),
        Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              value: isActive,
              onChanged: (bool val) {},
            ))
      ],
    );
  }

  GestureDetector buildAccountOptionRow(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/CD');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: mycolor['textColor'],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: mycolor['textColor'],
            ),
          ],
        ),
      ),
    );
  }
}

class Abc extends StatelessWidget {
  String? text;
  IconData? icon;
  Color? color;
  Abc({this.text, this.icon,this.color});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top:20.0,bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon,color: color,),
              SizedBox(
                width: 14,
              ),
              Text(
                text!,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: mycolor['textColor'],
                ),
              ),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: mycolor['textColor'],
          ),
          
        ],
      ),
    );
  }
}
