import 'package:flutter/material.dart';

class LeaveRequestScreen extends StatelessWidget {
  const LeaveRequestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Center(
              child: Text(
                  "Leave Request",
              style: TextStyle(
                  fontFamily: "nexaBold"
              ),),
            ),
          ],
        ),
    );

  }
}
