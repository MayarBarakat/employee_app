import 'package:flutter/material.dart';

class HourlyLeaveRequestScreen extends StatefulWidget {
  @override
  _HourlyLeaveRequestScreenState createState() =>
      _HourlyLeaveRequestScreenState();
}

class _HourlyLeaveRequestScreenState extends State<HourlyLeaveRequestScreen> {
  late DateTime selectedDate = DateTime(2024);
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  TextEditingController reasonController = TextEditingController();

  @override
  void dispose() {
    reasonController.dispose();
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
      });
    }
  }

  void _submitLeaveRequest() {
    if (selectedDate != null &&
        startTime != null &&
        endTime != null &&
        reasonController.text.isNotEmpty) {
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
                  // TODO: Navigate to another screen or perform any desired actions
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Incomplete Form'),
            content: Text('Please fill in all the required fields.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hourly Leave Request'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Date:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: _selectDate,
              child: Text(selectedDate != null
                  ? '${selectedDate.toLocal()}'.split(' ')[0]
                  : 'Select Date'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Start Time:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: _selectStartTime,
              child: Text(startTime != null
                  ? startTime!.format(context)
                  : 'Select Start Time'),
            ),
            SizedBox(height: 16.0),
            Text(
              'End Time:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: _selectEndTime,
              child: Text(endTime != null
                  ? endTime!.format(context)
                  : 'Select End Time'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Reason:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            TextField(
              controller: reasonController,
              decoration: InputDecoration(
                hintText: 'Enter reason',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _submitLeaveRequest,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
