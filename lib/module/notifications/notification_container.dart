import 'package:employee_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class NotificationContainer extends StatelessWidget {
   NotificationContainer({Key? key}) : super(key: key);
  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'الإشعارات العامة',icon: Icon(Icons.notifications_active_outlined)),
    Tab(text: 'الإشعارات الخاصة',icon: Icon(Icons.privacy_tip_outlined),),
  ];

// Define the content for each tab
  final List<Widget> myTabViews = <Widget>[
    Center(child: Text('Content for Tab 1')),
    Center(child: Text('Content for Tab 2')),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: defaultColor,
          title: Text('الإشعارات'),
          centerTitle: true,
          bottom: TabBar(
            tabs: myTabs,
          ),
        ),
        backgroundColor: backgroundColor,
        body: TabBarView(
          children: myTabViews,
        ),
      ),
    );
  }
}
