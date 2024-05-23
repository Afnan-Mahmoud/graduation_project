import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../Diseases result/resultpage.dart';

part 'start_page_state.dart';

class StartPageCubit extends Cubit<StartPageState> {
  StartPageCubit() : super(StartPageInitial());
  static StartPageCubit get(context)=>BlocProvider.of(context);
  int index=1;
  bool bottomNavigationCheck=true;
  File? userImgFile;

  changeIndex(int realIndex){
    index=realIndex;
    emit(ChangeIndexSuc());
  }
  changeBottomNavigationCheck(bool newCheck){
    bottomNavigationCheck=newCheck;
    emit(ChangeBottomNavigationCheckSuc());
  }
}
