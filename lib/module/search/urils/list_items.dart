import 'package:employee_app/module/profile/profile_screen.dart';
import 'package:employee_app/shared/components/components.dart';
import 'package:flutter/material.dart';
final List<Doctor> doctors = [
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
  ),Doctor(
    name: 'Dr. Jane Smith',
    specialty: 'Pediatrics',
    imageUrl: 'https://example.com/doctor_image_2.jpg',
    floor: 'Second Floor',
    isAvailable: false,
  ),

  // Add more doctors as needed
];
class DoctorListItem extends StatelessWidget {
  final Doctor doctor;

  DoctorListItem({required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 8.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)
        ),
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
                  borderRadius: BorderRadius.circular(12)
              ),
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
                navigateTo(context, ProfileScreen());
                },
            ),
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