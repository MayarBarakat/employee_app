import 'package:employee_app/shared/components/components.dart';
import 'package:employee_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';

import '../../details_screen/doctor_details_screen.dart';
import 'utils/size_confige.dart';


class DoctorsScreen extends StatelessWidget {
  final List<Doctor> doctors = [
    Doctor(
      name: 'Dr. John Doe',
      specialty: 'Cardiology',
      floor: 'First Floor',
      imageUrl: 'https://example.com/doctor_image_1.jpg',
      isAvailable: true,
    ),
    Doctor(
      name: 'Dr. John Doe',
      specialty: 'Cardiology',
      floor: 'First Floor',
      imageUrl: 'https://example.com/doctor_image_1.jpg',
      isAvailable: true,
    ),
    Doctor(
      name: 'Dr. Jane Smith',
      specialty: 'Pediatrics',
      imageUrl: 'https://example.com/doctor_image_2.jpg',
      floor: 'Second Floor',
      isAvailable: false,
    ),
    Doctor(
      name: 'Dr. Jane Smith',
      specialty: 'Pediatrics',
      imageUrl: 'https://example.com/doctor_image_2.jpg',
      floor: 'Second Floor',
      isAvailable: false,
    ),
    Doctor(
      name: 'Dr. Jane Smith',
      specialty: 'Pediatrics',
      imageUrl: 'https://example.com/doctor_image_2.jpg',
      floor: 'Second Floor',
      isAvailable: false,
    ),
    Doctor(
      name: 'Dr. Jane Smith',
      specialty: 'Pediatrics',
      imageUrl: 'https://example.com/doctor_image_2.jpg',
      floor: 'Second Floor',
      isAvailable: false,
    ),
    // Add more doctors as needed
  ];
  @override
  Widget build(BuildContext context) {
    SizeConfig.initSize(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text("الأطباء"),
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.all(16),
          child: GridView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              crossAxisCount: 2,
              childAspectRatio: .56,
            ),
            children: [
             buildDoctorItem(
                 context: context,
                 name: "بشار رباح",
                 speciality: "اخصائي اذن, أنف, حنجرة",
                 isAvailable: true
             ),
              buildDoctorItem(
                  context: context,
                  name: "بشار رباح",
                  speciality: "اخصائي اذن, أنف, حنجرة",
                  isAvailable: true
              ),
              buildDoctorItem(
                  context: context,
                  name: "بشار رباح",
                  speciality: "اخصائي اذن, أنف, حنجرة",
                  isAvailable: true
              ),
              buildDoctorItem(
                  context: context,
                  name: "بشار رباح",
                  speciality: "اخصائي اذن, أنف, حنجرة",
                  isAvailable: true
              ),
              buildDoctorItem(
                  context: context,
                  name: "بشار رباح",
                  speciality: "اخصائي اذن, أنف, حنجرة",
                  isAvailable: true
              ),
              buildDoctorItem(
                  context: context,
                  name: "بشار رباح",
                  speciality: "اخصائي اذن, أنف, حنجرة",
                  isAvailable: true
              ),

            ],
          ),
        ),
      ),
    );
  }
  Widget buildDoctorItem({
    required BuildContext context,
    required String name,
    required String speciality,
    required bool isAvailable,
}){
    return InkWell(
      onTap: (){
        navigateTo(context, DoctorDetailsScreen());
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 2), // changes the position of the shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                              ),
                              color: defaultColor,
                            ),
                            height: getRelativeHeight(0.14),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Container(
                                    width: getRelativeHeight(0.13),
                                    height: getRelativeHeight(0.13),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 15,
                                          color: Colors.red
                                              .withOpacity(0.6)),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    width: getRelativeHeight(0.11),
                                    height: getRelativeHeight(0.11),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 15,
                                          color: Colors.grey
                                              .withOpacity(0.25)),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    width: getRelativeHeight(0.11),
                                    height: getRelativeHeight(0.11),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 15,
                                          color: Colors.grey
                                              .withOpacity(0.17)),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                          width: 190,
                          height: getRelativeHeight(0.19),
                          child: Image.asset('assets/images/doctor_1.png')),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25))),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: getRelativeHeight(0.01),
                          horizontal: getRelativeWidth((0.05))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: getRelativeWidth(0.041)),
                          ),
                          SizedBox(height: getRelativeHeight(0.005)),
                          Text(
                            speciality,
                            style: TextStyle(
                                color: Colors.black.withOpacity(.9),
                                fontSize: getRelativeWidth(0.032)),
                          ),
                          SizedBox(height: getRelativeHeight(0.004)),
                          isAvailable
                              ? Chip(
                            label: Text(
                              'Available',
                              style: TextStyle(color: Colors.white),
                            ),
                            backgroundColor: Colors.green,
                          )
                              : Chip(
                            label: Text(
                              'Not Available',
                              style: TextStyle(color: Colors.white),
                            ),
                            backgroundColor: Colors.red,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class Doctor {
  final String name;
  final String specialty;
  final String imageUrl;
  final String floor;
  final bool isAvailable;

  Doctor({
    required this.name,
    required this.specialty,
    required this.imageUrl,
    required this.floor,
    required this.isAvailable,
  });
}

class DoctorListItem extends StatelessWidget {
  final Doctor doctor;

  DoctorListItem({required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 8.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: SizedBox(
          height: 100,
          child: Center(
            child: ListTile(
              leading: Image.asset(
                'assets/images/doctors.webp',
                height: 60,
                width: 60,
                fit: BoxFit.cover,
              ),
              title: Text(doctor.name),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(doctor.specialty),
                  Text(doctor.floor),
                ],
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              trailing: doctor.isAvailable
                  ? Chip(
                      label: Text(
                        'Available',
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.green,
                    )
                  : Chip(
                      label: Text(
                        'Not Available',
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.red,
                    ),
              onTap: () {
                // Add any desired functionality when a doctor item is tapped
              },
            ),
          ),
        ),
      ),
    );
  }
}
