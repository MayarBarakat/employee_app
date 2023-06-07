import 'package:flutter/material.dart';

import '../../urils/list_items.dart';

class EmergencyScreen extends StatelessWidget {
   EmergencyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("الإسعاف"),
        centerTitle: true,
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),

        itemCount: doctors.length,
        itemBuilder: (context, index) {
          return DoctorListItem(doctor: doctors[index]);
        },
      )
    );
  }
}


