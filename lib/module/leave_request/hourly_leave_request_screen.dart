import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:employee_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class HourlyLeaveRequestScreen extends StatefulWidget {
  @override
  _HourlyLeaveRequestScreenState createState() =>
      _HourlyLeaveRequestScreenState();
}

class _HourlyLeaveRequestScreenState extends State<HourlyLeaveRequestScreen> {
  DateTime? selectedDate;
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  TextEditingController reasonController = TextEditingController();
  final jobRoleCtrl = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    reasonController.dispose();
    FocusScope.of(context).unfocus();
    super.dispose();
  }

  void _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
        FocusScope.of(context).unfocus();
      });
    }
  }

  void _selectStartTime() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null && pickedTime != startTime) {
      setState(() {
        startTime = pickedTime;
        FocusScope.of(context).unfocus();
      });
    }
  }

  void _selectEndTime() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null && pickedTime != endTime) {
      setState(() {
        endTime = pickedTime;
        FocusScope.of(context).unfocus();
      });
    }
  }

  void _submitLeaveRequest() {
    if (_formKey.currentState!.validate()) {
      if (selectedDate == null) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Incomplete Form'),
              content: Text('يرجى اختيار اليوم'),
              actions: [
                TextButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    Navigator.of(context).pop();

                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
        return;
      }
      else if(startTime == null){
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Incomplete Form'),
                content: Text('يرجى اختيار وقت البدء'),
                actions: [
                  TextButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      Navigator.of(context).pop();
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );

          return;

      }
      else if(endTime == null){
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Incomplete Form'),
              content: Text('يرجى اختيار وقت الإنتهاء'),
              actions: [
                TextButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );

        return;

      }

      // TODO: Implement leave request submission logic
      // You can send the selectedDate, startTime, endTime, and reasonController.text to your API or perform any necessary actions here.
      // You can show a confirmation message or navigate to another screen upon successful submission.
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Leave Request Submitted'),
            content: Text('Your leave request has been submitted successfully.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  // TODO: Navigate to another screen or perform any desired actions
                },
                child: Text('OK'),
              ),
            ],
          );

        },
      );
      FocusScope.of(context).unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('طلب إجازة ساعية'),
        centerTitle: true,
        backgroundColor: defaultColor,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'إختر نوع الإجازة: ',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, fontFamily: 'NexaRegular'),
                ),
                SizedBox(height: 8,),
                CustomDropdown(
                  fillColor: defaultColor.withOpacity(0.2),
                  errorText: 'يرجى إختيار نوع الإجازة',
                  hintStyle: TextStyle(color: Colors.black,),
                  hintText: 'اختر نوع الإجازة',
                  excludeSelected: true,
                  items: const ['إجازة سنوية', 'إجازة غير مدفوعة', 'إجازة مرضية', 'إجازة زواج', 'إجازة حج', 'إجازة وفاة', 'إجازة أمومة'],
                  controller: jobRoleCtrl,
                ),
                buildSpace(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'تحديد اليوم: ',
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)
                            )
                        ),
                        onPressed: _selectDate,
                        child: Text(selectedDate != null
                            ? '${selectedDate!.toLocal()}'.split(' ')[0]
                            : 'تحديد اليوم',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                      ),
                    ),
                  ],
                ),

                buildSpace(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'وقت البدء:',
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            )
                        ),
                        onPressed: _selectStartTime,
                        child: Text(startTime != null
                            ? startTime!.format(context)
                            : 'تحديد وقت البدء',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                      ),
                    ),
                  ],
                ),

                buildSpace(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'وقت الإنتهاء',
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)
                            )
                        ),
                        onPressed: _selectEndTime,
                        child: Text(endTime != null
                            ? endTime!.format(context)
                            : 'تحديد وقت الإنتهاء',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                      ),
                    ),
                  ],
                ),

                buildSpace(),

                Text(
                  'سبب الإجازة: ',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                TextFormField(
                  controller: reasonController,
                  decoration: InputDecoration(
                    hintText: 'إدخال السبب',
                    labelText: "السببي",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Colors.green,
                        width: 2.0,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2.0,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    errorStyle: TextStyle(color: Colors.red),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'يرجى إدخال سبب الإجازة';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 4,
                        shadowColor: backgroundColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        )
                    ),
                    onPressed: _submitLeaveRequest,
                    child: Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSpace(){
    return Column(
      children: [
        SizedBox(height: 12.0),
        Divider(thickness: 2,color: defaultColor,),
        SizedBox(height: 8,),
      ],
    );
  }
}
