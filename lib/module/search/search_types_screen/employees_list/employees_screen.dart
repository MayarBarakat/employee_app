import 'package:employee_app/module/profile/profile_screen.dart';
import 'package:employee_app/shared/components/components.dart';
import 'package:flutter/material.dart';

import '../../urils/list_items.dart';

class EmployeesScreen extends StatelessWidget {
   EmployeesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("الموظفين"),
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
