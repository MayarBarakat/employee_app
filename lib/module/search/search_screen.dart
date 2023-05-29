import 'package:employee_app/module/search/search_types_screen/doctors_screen.dart';
import 'package:employee_app/module/search/search_types_screen/emergency_screen.dart';
import 'package:employee_app/module/search/search_types_screen/employees_screen.dart';
import 'package:employee_app/module/search/search_types_screen/kitchen_screen.dart';
import 'package:employee_app/module/search/search_types_screen/nurses_screen.dart';
import 'package:employee_app/shared/components/components.dart';
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
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text(
                    'البحث',
                    style: TextStyle(color: Colors.black, fontSize: 25.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 5.0, left: 8.0, right: 8.0, bottom: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: defaultColor.withOpacity(.8),
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
                          childAspectRatio: .8,
                      ),
                      children: [
                        buildGridItem(
                            name: 'الأطباء',
                            image: 'doctors.webp',
                            widgetToNavigate: DoctorsScreen(),
                        ),
                        buildGridItem(
                          name: 'الممرضات',
                          image: 'nurses.jpg',
                          widgetToNavigate: NursesScreen(),
                        ),
                        buildGridItem(
                          name: 'الإسعاف',
                          image: 'emergency.jpg',
                          widgetToNavigate: EmergencyScreen(),
                        ),
                        buildGridItem(
                          name: 'الموظفين',
                          image: 'employee.jpg',
                          widgetToNavigate: EmployeesScreen(),
                        ),
                        buildGridItem(
                          name: 'المطبخ',
                          image: 'kitchen.jpg',
                          widgetToNavigate: KitchenScreen(),
                        ),

                      ]
                  ),
                ),
              ],
            ),

        ),
      ),
    );
  }
  Widget buildGridItem({required String name,required String image,required widgetToNavigate}){
    return GestureDetector(
      onTap: () {
        navigateTo(context, widgetToNavigate);
      },
      child: Card(
        elevation: 8.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,

          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 140.0,
              width: double.infinity,
              decoration:  BoxDecoration(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(10.0)),
                image: DecorationImage(
                  image: AssetImage('assets/images/$image'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children:  [
                  Text(
                    name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}