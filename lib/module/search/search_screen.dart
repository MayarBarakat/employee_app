import 'package:employee_app/layout/cubit/employee_cubit.dart';
import 'package:employee_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:searchbar_animation/searchbar_animation.dart';

class SearchbarAnimationExample extends StatefulWidget {

  @override
  _SearchbarAnimationExampleState createState() =>
      _SearchbarAnimationExampleState();
}

class _SearchbarAnimationExampleState extends State<SearchbarAnimationExample> {
  double height = 0;
  double width = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _buildSearchbarAnimation(),
    );
  }

  Widget _buildSearchbarAnimation() {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(0, 169, 191, 1),
                defaultColor,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
            ),
          ),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Text(
                  'البحث',
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 5.0, left: 8.0, right: 8.0, bottom: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.8),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(30.0),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: SearchBarAnimation(
                          durationInMilliSeconds: 300,
                          textEditingController: TextEditingController(),
                          isOriginalAnimation: true,
                          enableKeyboardFocus: true,
                          onExpansionComplete: () {
                            debugPrint(
                                'do something just after searchbox is opened.');
                          },
                          onCollapseComplete: () {
                            debugPrint(
                                'do something just after searchbox is closed.');
                          },
                          onPressButton: (isSearchBarOpens) {
                            debugPrint(
                                'do something before animation started. It\'s the ${isSearchBarOpens ? 'opening' : 'closing'} animation');
                          },
                          trailingWidget: const Icon(
                            Icons.search,
                            size: 20,
                            color: Colors.black,
                          ),
                          secondaryButtonWidget: const Icon(
                            Icons.close,
                            size: 20,
                            color: Colors.black,
                          ),
                          buttonWidget: const Icon(
                            Icons.search,
                            size: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        crossAxisCount: 2,
                        childAspectRatio: 1.1,
                    ),
                    children: [
                      buildDepartmentItem(),

                      buildDepartmentItem(),
                      buildDepartmentItem(),
                      buildDepartmentItem(),
                      buildDepartmentItem(),
                    ]
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget buildDepartmentItem(){
    return InkWell(
      onTap: () {
      },
      child: Container(

        padding: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
                color: Colors.white,
                offset: Offset(1, 1),
                blurRadius: 3,
                spreadRadius: 1.5
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
                  FontAwesomeIcons.userNurse,
                  size: 80,
                  color: defaultColor,
                ),

              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 12,),
              child: Text(
                "الممرضات",
                style: TextStyle(
                  fontFamily: "NexaRegular",
                  fontSize: width / 20,
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