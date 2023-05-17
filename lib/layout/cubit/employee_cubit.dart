import 'package:bloc/bloc.dart';
import 'package:employee_app/module/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'employee_state.dart';

class EmployeeCubit extends Cubit<EmployeeState> {
  EmployeeCubit() : super(EmployeeInitial());

  static EmployeeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> bottomScreen = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(EmployeeChangeBottomState());
  }

}
