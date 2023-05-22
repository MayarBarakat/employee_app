import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../shared/styles/colors.dart';

Widget buildWelcomeMessage({required double screenWidth}){
  return Container(
    alignment: Alignment.centerLeft,
    margin: const EdgeInsets.only(top: 32),
    child: Text(
      "Welcome,",
      style: TextStyle(
        color: Colors.black54,
        fontFamily: "NexaRegular",
        fontSize: screenWidth / 20,
      ),
    ),
  );
}
Widget buildEmployeeName({required String employeeName,required double screenWidth}){
  return Container(
    alignment: Alignment.centerLeft,
    child: Text(
      employeeName,
      style: TextStyle(
        fontFamily: "NexaBold",
        fontSize: screenWidth / 18,
      ),
    ),
  );
}
Widget buildTodayStatusSection({required double screenWidth}) {
  return Container(
    alignment: Alignment.center,
    margin: const EdgeInsets.only(top: 32),
    child: Text(
      "Today's Status",
      style: TextStyle(
        fontFamily: "NexaBold",
        fontSize: screenWidth / 18,
      ),
    ),
  );
}
Widget buildCheckItem({required String checkStatus,required double screenWidth}){
  return Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Check In",
          style: TextStyle(
            fontFamily: "NexaRegular",
            fontSize: screenWidth / 20,
            color: Colors.black54,
          ),
        ),
        Text(
          checkStatus,
          style: TextStyle(
            fontFamily: "NexaBold",
            fontSize: screenWidth / 18,
          ),
        ),
      ],
    ),
  );
}
Widget buildCheckSection({required double screenWidth,required String checkIn,required String checkOut}){
  return Container(
    margin: const EdgeInsets.only(top: 12, bottom: 32),
    height: 150,
    decoration: const BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 10,
          offset: Offset(2, 2),
        ),
      ],
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        buildCheckItem(checkStatus: checkIn,screenWidth: screenWidth),
        // Vertical divider
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 14.0),
          child: VerticalDivider(
            color: defaultColor,
            thickness: 1.0,
          ),
        ),
        buildCheckItem(checkStatus: checkOut,screenWidth: screenWidth),
      ],
    ),
  );
}
Widget buildTodayDateSection({required double screenWidth}){
  return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: RichText(
        text: TextSpan(
          text: DateTime.now().day.toString(),
          style: TextStyle(
            color: defaultColor,
            fontSize: screenWidth / 18,
            fontFamily: "NexaBold",
          ),
          children: [
            TextSpan(
              text: DateFormat(' MMMM yyyy').format(DateTime.now()),
              style: TextStyle(
                color: Colors.black,
                fontSize: screenWidth / 20,
                fontFamily: "NexaBold",
              ),
            ),
          ],
        ),
      )
  );
}
Widget buildRemainingTime({required Stream<int> stream,required double screenWidth}){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 8),
    child: StreamBuilder<int>(
      stream: stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          int remainingTime = snapshot.data!;

          if (remainingTime <= 0) {
            return const Text(
              'Countdown Completed',
              style: TextStyle(fontSize: 24),
            );
          }

          String formattedTime = formatTime(remainingTime);

          return Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Remaining Time: ${formattedTime}",
              style: TextStyle(
                fontFamily: "NexaRegular",
                fontSize: screenWidth / 20,
                color: Colors.black54,
              ),
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    ),
  );
}


String formatTime(int seconds) {
  int hours = seconds ~/ 3600;
  int minutes = (seconds % 3600) ~/ 60;
  int remainingSeconds = seconds % 60;
  return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
}
