import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/Screens/Pages/Register/Login/login%20screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import '../../../Models/UserModel.dart';
import '../Diseases result/resultpage.dart';

part 'start_page_state.dart';

class StartPageCubit extends Cubit<StartPageState> {
  StartPageCubit() : super(StartPageInitial());
  static StartPageCubit get(context)=>BlocProvider.of(context);
  int index=1;
  bool bottomNavigationCheck=true;
  File? userImgFile;
  UserModel userModel = UserModel( Email: "");

  changeIndex(int realIndex){
    index=realIndex;
    emit(ChangeIndexSuc());
  }
  changeBottomNavigationCheck(bool newCheck){
    bottomNavigationCheck=newCheck;
    emit(ChangeBottomNavigationCheckSuc());
  }
  Logout(BuildContext context){
    return FirebaseAuth.instance.signOut()
        .then((value) => Navigator.pushNamedAndRemoveUntil(context, LoginScreen.routeName, (route) => false));
  }
  getProfileDataFromFirebase() {
    emit(SetProfileGetDataFromFirebaseLoadingState());
    FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        UserModel profile = UserModel(
            profileImage: documentSnapshot.get('profileImage'),
            fullName: documentSnapshot.get('fullName'),
            address: documentSnapshot.get('address'),
            Email: documentSnapshot.get('Email'),
            id: documentSnapshot.get('id'),
            phoneNo: documentSnapshot.get('phoneNo'));
        userModel = profile;
        emit(ProfileGetDataFromFirebaseSuccsesState());
      } else {
        print('Document does not exist on the database');
      }
    });
  }
}