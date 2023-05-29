import 'package:employee_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("الإعدادات",style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: defaultColor,
      ),
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              profilePic(),
              SizedBox(
                height: 20,
              ),
              profileMenu(context,
                  text: 'مساعدة',
                  icon: Icons.question_answer_outlined,
                  press: () {
                // navigateTo(context, HelpScreen());
                  }
              ),
              profileMenu(context,
                  text: 'تسجيل الخروج', icon: Icons.logout, press: () {
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context)=>AlertDialog(
                          title: Text('تأكيد تسجيل الخروج',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          alignment: Alignment.center,
                          actionsAlignment: MainAxisAlignment.spaceBetween,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          actions: [
                            TextButton(
                                onPressed: (){
                                  // CacheHelper.removeData(key: "isLoggedIn");
                                  // DoctorCubit.get(context).currentIndex = 0;
                                  // navigateAndFinish(context, LoginScreen());

                                },
                                child: Text('تسجيل الخروج',style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18
                                ),)
                            ),
                            TextButton(
                                onPressed: (){
                                  Navigator.of(context).pop();

                                },
                                child: Text('الغاء',style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18
                                ),)
                            ),
                          ],
                        )
                    );
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget profileMenu(context,
      {required String text, required icon, required VoidCallback press}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          primary: Color(0xFFF5F6F9),
        ),
        onPressed: press,
        child: (Row(
          children: [
            Icon(
              icon,
              size: 32,
              color:  Color(0xff30384c),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                text,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Icon(Icons.arrow_forward_ios,color: Colors.grey,),
          ],
        )),
      ),
    );
  }

  Widget profilePic() {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/person.png'),
            backgroundColor: Colors.grey[300],
          ),
        ],
      ),
    );
  }
}
