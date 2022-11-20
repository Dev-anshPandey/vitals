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
              height: 20,
            ),
            buildAccountOptionRow(context, "Health Checklist"),
            buildAccountOptionRow(context, "Notifications"),

            SizedBox(
              height: 60,
            ),
            Row(
              children: [
                Text(
                  "Privacy",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 20,
            ),
            buildAccountOptionRow(context, "Apps"),
            buildAccountOptionRow(context, "Research Studies"),
            buildAccountOptionRow(context, "Devices"),

            SizedBox(
              height: 50,
            ),
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
              fontSize: 18,
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
                fontSize: 18,
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
