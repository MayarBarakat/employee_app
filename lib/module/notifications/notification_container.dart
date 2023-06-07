import 'package:employee_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
// Define the custom NotificationItem widget
class NotificationItem extends StatelessWidget {
  final String title;
  final String message;
  final IconData icon;

  const NotificationItem({
    required this.title,
    required this.message,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          subtitle: Text(
            message,
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          leading: Icon(icon,color: defaultColor,),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: defaultColor,
          ),
        ),
      ),
    );
  }
}

class NotificationContainer extends StatelessWidget {
   NotificationContainer({Key? key}) : super(key: key);
  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'الإشعارات العامة',icon: Icon(Icons.notifications_active_outlined)),
    Tab(text: 'الإشعارات الخاصة',icon: Icon(Icons.privacy_tip_outlined),),
  ];

// Define the content for each tab
  final List<Widget> myTabViews = <Widget>[
    ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {

        return NotificationItem(
          title: 'notification.title',
          message:' notification.message',
          icon: Icons.notifications_active_outlined,
        );
      },
    ),
    ListView.builder(
      itemCount: 2,
      itemBuilder: (context, index) {

        return NotificationItem(
          title: 'notification.title',
          message:' notification.message',
          icon: Icons.privacy_tip_outlined,
        );
      },
    ),
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
