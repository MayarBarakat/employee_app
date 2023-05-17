
import 'package:employee_app/layout/cubit/employee_cubit.dart';
import 'package:employee_app/layout/utils/rive_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';





class EmployeeLayout extends StatefulWidget {


  @override
  State<EmployeeLayout> createState() => _EmployeeLayoutState();
}

class _EmployeeLayoutState extends State<EmployeeLayout> {

  RiveAsset selectedBottomNav = bottomNavs.first;
  @override
  Widget build(BuildContext context) {
    var cubit = EmployeeCubit.get(context);
    return BlocConsumer<EmployeeCubit, EmployeeState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.grey[300],
            body: IndexedStack(
              index: cubit.currentIndex,
              children: cubit.bottomScreen,
            ),
            bottomNavigationBar: SafeArea(
              child: Container(
                padding: EdgeInsets.all(12),
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Color(0xff145362),
                    borderRadius: BorderRadius.all(Radius.circular(24))
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...List.generate(bottomNavs.length,
                            (index) =>GestureDetector(
                          onTap: (){
                            bottomNavs[index].input!.change(true);
                            if(bottomNavs[index] != selectedBottomNav){
                              setState(() {
                                selectedBottomNav = bottomNavs[index];
                              });
                            }
                            cubit.changeBottom(index);
                            Future.delayed( Duration(seconds: 1),(){
                              bottomNavs[index].input!.change(false);

                            });
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [

                              SizedBox(
                                height: 36,
                                width: 36,
                                child: Opacity(
                                  opacity: bottomNavs[index] == selectedBottomNav? 1: 0.5,
                                  child: RiveAnimation.asset(
                                    bottomNavs.first.src,
                                    artboard: bottomNavs[index].artBoard,
                                    animations: [],
                                    onInit: (artboard){
                                      StateMachineController controller = RiveUtils.getRiveController(
                                          artboard,
                                          stateMachineName: bottomNavs[index].stateMachineName
                                      );
                                      bottomNavs[index].input = controller.findSMI("active") as SMIBool;
                                    },
                                  ),
                                ),
                              ),
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                height: 25,
                                width: bottomNavs[index] == selectedBottomNav? 70 : 0,

                                child: Text(bottomNavs[index].title,textAlign: TextAlign.center,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),),
                              ),
                            ],
                          ),
                        )
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },

    );
  }
}
class RiveAsset{
  final String artBoard, stateMachineName,title,src;
  late SMIBool? input;

  RiveAsset(this.src,{
    required this.artBoard,
    required this.stateMachineName,
    required this.title,
    this.input

  });

  set setInput(SMIBool status){
    input = status;
  }
}

List<RiveAsset>bottomNavs = [
  RiveAsset("assets/images/icons.riv", artBoard: "TIMER", stateMachineName: "TIMER_Interactivity", title: "الدوام"),
  RiveAsset("assets/images/icons.riv", artBoard: "CHAT", stateMachineName: "CHAT_Interactivity", title: "طلب إجازة"),
  RiveAsset("assets/images/icons.riv", artBoard: "SEARCH", stateMachineName: "SEARCH_Interactivity", title: "البحث"),
  RiveAsset("assets/images/icons.riv", artBoard: "BELL", stateMachineName: "BELL_Interactivity", title: "الإشعارات"),
  RiveAsset("assets/images/icons.riv", artBoard: "USER", stateMachineName: "USER_Interactivity", title: "حسابي"),

];