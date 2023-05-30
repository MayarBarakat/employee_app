import 'package:flutter/material.dart';

import '../../shared/styles/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold (
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                    color: defaultColor,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(40),
                      bottomLeft: Radius.circular(40),
                    )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      maxRadius: 50,
                      minRadius: 50,
                      backgroundColor: defaultColor,
                      backgroundImage: AssetImage('assets/images/doctor1.jpg'),
                    ),
                    SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('د.بشار رباح',style: TextStyle(fontFamily: 'NexaBold',color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                        Text('طبيب أذن, أنف, حنجرة',style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            fontSize: 14,
                            color: Colors.white
                        ),)

                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildDetailRow(title: 'title', value: 'value'),
                  buildDetailRow(title: 'title', value: 'value'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildDetailRow(title: 'title', value: 'value'),
                  buildDetailRow(title: 'title', value: 'value'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildDetailRow(title: 'title', value: 'value'),
                  buildDetailRow(title: 'title', value: 'value'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildDetailRow(title: 'title', value: 'value'),
                  buildDetailRow(title: 'title', value: 'value'),
                ],
              ),
              SizedBox(height: 20,),
              buildBigDetailRow(title: 'العنوان', value: "ساحة الرئيس"),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDetailRow(
      {
        required String title,
        required String value,
      }
      ){
    return Container(
      padding: EdgeInsets.only(right: 5,left: 5,top: 10,),
      width: MediaQuery.of(context).size.width / 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,style: Theme.of(context).textTheme.subtitle2!.copyWith(
                  color: Colors.black.withOpacity(.6),
                  fontWeight: FontWeight.w600,
                  fontSize: 15
              ),),
              SizedBox(height: 5,),
              Text(value,style: Theme.of(context).textTheme.subtitle2!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 15
              ),),
              SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                child: Divider(
                  thickness: 1.0,
                ),
              ),
            ],
          ),
          Icon(Icons.lock_outline_rounded,size: 20.0,)
        ],
      ),
    );
  }

  Widget buildBigDetailRow({
    required String title,
    required String value
  }){
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            child: Column(
              children: [
                Text(title,style: Theme.of(context).textTheme.subtitle2!.copyWith(
                  color: Colors.black.withOpacity(.7),
                  fontSize: 15.0,
                ),),
                SizedBox(height: 10,),
                Text(value,style: Theme.of(context).textTheme.subtitle2!.copyWith(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,

                ),),
                SizedBox(height: 10,),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.1,
                  child: Divider(
                    thickness: 1.0,
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.lock_outline_rounded,size: 20,),
        ],
      ),
    );
  }
}
