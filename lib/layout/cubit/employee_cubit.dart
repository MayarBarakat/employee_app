import 'package:bloc/bloc.dart';
import 'package:employee_app/module/leave_request/leave_request_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../module/attendance/attendance_screen.dart';

part 'employee_state.dart';

class EmployeeCubit extends Cubit<EmployeeState> {
  EmployeeCubit() : super(EmployeeInitial());

  static EmployeeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> bottomScreen = [
    AttendanceScreen(),
    LeaveRequestScreen(),
    AttendanceScreen(),
    AttendanceScreen(),
    AttendanceScreen(),

  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(EmployeeChangeBottomState());
  }

}
