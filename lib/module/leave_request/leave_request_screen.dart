
import 'package:employee_app/module/leave_request/daily_leave_request_screen.dart';
import 'package:employee_app/module/leave_request/hourly_leave_request_screen.dart';
import 'package:employee_app/shared/components/components.dart';
import 'package:employee_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LeaveRequestScreen extends StatelessWidget {

  double height = 0;
  double width = 0;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return  SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
            Container(
              height: 150,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                ),
                color: defaultColor,
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 40,
                    left: 0,
                    child: Container(
                      height: 90,
                      width: 300,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          bottomRight: Radius.circular(50)
                        )
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 70,
                      left: 100,
                      child: Text(
                        "الإجازات",
                        style: TextStyle(
                            fontSize: 20,
                            color: defaultColor),
                      ))
                ],
              ),
            ),
              SizedBox(height: height * 0.05,),
              buildLeaveRequestItem(
                  context: context,
                  title: "طلب إجازة ساعية",
                  condition: "لا يمكن طلب أكثر من ساعتين",
                  trail: "طلب إجازة ساعية",
                  lottie: "clock",
                  onTap: (){
                    navigateTo(context, HourlyLeaveRequestScreen());
                  }
              ),
              SizedBox(height: 10,),
              buildLeaveRequestItem(
                  context: context,
                  title: "طلب إجازة يومية",
                  condition: "لا يمكن طلب أكثر من يوم",
                  trail: "طلب إجازة يوم",
                  lottie: "day",
                  onTap: (){
                    navigateTo(context, DailyLeaveRequestScreen());
                  }
              ),
            ],
          ),
      ),
    );

  }
  Widget buildLeaveRequestItem({
    required BuildContext context,
    required String title,
    required String condition,
    required  String trail,
    required String lottie,
    required  onTap
  }){
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height / 3.2,
        child: Stack(
          children: [
            Positioned(
              top: 25,
              left: 20,
              child: Material(
                child: Container(
                  height: width /2,
                  width: width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(0.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        offset: Offset(-10.0, 10.0),
                        blurRadius: 20.0,
                        spreadRadius: 4.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 15,
              left: 25,
              child: Card(
                elevation: 10.0,
                color: defaultColor,
                shadowColor: Colors.grey.withOpacity(0.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),

                ),
                child: Container(
                  height: 160,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),

                  ),
                  child: Lottie.asset('assets/lottie/$lottie.json',fit: BoxFit.fill),
                ),
              ),
            ),
            Positioned(
              top: 60,
              left: 210,
              child: SizedBox(
                height: 150,
                width: 160,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 20.0,
                          color: defaultColor,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      condition,
                      style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    const Divider(color: defaultColor,thickness: 2,),
                    Text(
                      trail,
                      style: const TextStyle(
                          fontSize: 20.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
