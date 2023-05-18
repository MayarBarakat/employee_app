import 'package:employee_app/module/attendance/attendance_cubit/attendance_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../shared/styles/colors.dart';
import 'attendance_utils/attendance_utils.dart';

class AttendanceScreen extends StatefulWidget {

  AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  late Stream<int> _stream;


  Future<void> scanBarcode(BuildContext context) async {
    var cubit  = AttendanceCubit.get(context);
    // Scan barcode using FlutterBarcodeScanner
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
      '#ff6666', // Color of the toolbar background
      'Cancel', // Text for the cancel button
      true, // Show flash icon
      ScanMode.BARCODE, // Scan mode (BARCODE, QR)
    );

    if (!mounted) return; // Check if the widget is still mounted
    setState(() {
      if(cubit.checkIn == "--/--") {
        cubit.checkIn = DateFormat('hh:mm a').format(DateTime.now());
        countdownDuration = 8 * 60 * 60; // Set countdown duration to 8 hours in seconds
      }
      else if(cubit.checkOut == "--/--"){
        cubit.checkOut = DateFormat('hh:mm a').format(DateTime.now());
        countdownDuration = 0; // Reset countdown duration to 0
      }
      print('Scanned barcode: $barcodeScanRes');
    });
  }


  int countdownDuration = 0; // 8 hours in seconds

  @override
  void initState() {
    super.initState();
    // Initialize the countdown stream

      _stream = Stream.periodic(Duration(seconds: 1), (int count) =>countdownDuration - count);
      // Use the context here

  }

  @override
  Widget build(BuildContext context) {
    var cubit  = AttendanceCubit.get(context);
    cubit.screenHeight = MediaQuery.of(context).size.height;
    cubit.screenWidth = MediaQuery.of(context).size.width;
    return BlocConsumer<AttendanceCubit, AttendanceState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          // Welcome message
          buildWelcomeMessage(screenWidth: cubit.screenWidth),
          //Employee name
          buildEmployeeName(employeeName: "Mayar Barakat",screenWidth: cubit.screenWidth),
          // Today's status
          buildTodayStatusSection(screenWidth: cubit.screenWidth),
          // Check-in and Check-out section
          buildCheckSection(screenWidth: cubit.screenWidth,checkIn: cubit.checkIn,checkOut: cubit.checkOut),
          // Date display
          buildTodayDateSection(screenWidth: cubit.screenWidth),
          // Remaining time display
          buildRemainingTime(stream: _stream,screenWidth: cubit.screenWidth),
          const SizedBox(height: 12,),
          // Scan barcode button
          buildCheckInReader(context),
        ],
      ),
    );
  },
);
  }
  Widget buildCheckInReader(BuildContext context){
    var cubit  = AttendanceCubit.get(context);
    return GestureDetector(
      onTap: () async{
        await scanBarcode(context);
      },
      child: Container(
        height: cubit.screenWidth / 2,
        width: cubit.screenWidth / 2,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(2, 2),
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: const [
                Icon(
                  FontAwesomeIcons.expand,
                  size: 80,
                  color: defaultColor,
                ),
                Icon(
                  FontAwesomeIcons.camera,
                  size: 25,
                  color: defaultColor,
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 12,),
              child: Text(
                cubit.checkIn == "--/--" ? "Scan to Check In" : "Scan to Check Out",
                style: TextStyle(
                  fontFamily: "NexaRegular",
                  fontSize: cubit.screenWidth / 20,
                  color: Colors.black54,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
