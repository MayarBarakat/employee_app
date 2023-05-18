import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/cupertino.dart';


part 'attendance_state.dart';

class AttendanceCubit extends Cubit<AttendanceState>    {
  AttendanceCubit() : super(AttendanceInitial());
  static AttendanceCubit get(context) => BlocProvider.of(context);
  int countdownDuration = 0; // 8 hours in seconds

  double screenHeight = 0;
  double screenWidth = 0;

  String checkIn = "--/--";
  String checkOut = "--/--";


}
