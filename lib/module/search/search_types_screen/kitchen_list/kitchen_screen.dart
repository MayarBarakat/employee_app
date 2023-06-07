import 'package:flutter/material.dart';

import '../../urils/list_items.dart';

class KitchenScreen extends StatelessWidget {
   KitchenScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("المطبخ"),
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
