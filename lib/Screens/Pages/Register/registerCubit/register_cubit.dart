import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/Screens/Pages/Start%20Page/startpage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart';
import '../../../../Models/UserModel.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit get(context)=>BlocProvider.of(context);

  bool visble = false;
  String pass = '';
  String? user;
  String? id;
  String firstName = '';
  String LastName = '';
  File? userImgFile;
  String? userImgFileUrl;
  UserModel userModel = UserModel(Email: "");
  CollectionReference users = FirebaseFirestore.instance.collection('Users');

  String? validateEmail(String? value) {
    if (value != null) {
      if (value.length > 5 &&
          value.contains('@') &&
          value.endsWith('gmail.com')) {
        emit(SignupVaildatorEmailSuccsesState());
        return null;
      }
      emit(SignupVaildatorEmailErrorState());
      return 'Enter a Valid Email Address';
    }
  }

  String? validatePassword(String? value) {
    RegExp regex =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{8,}$');
    if (value!.isEmpty) {
      emit(SignupVaildatorPasswordErrorState());
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value)) {
        emit(SignupVaildatorPasswordErrorState());
        return 'Enter valid password';
      } else {
        emit(SignupVaildatorPasswordSuccsesState());
        return null;
      }
    }
  }
  visablePass() {
    if (visble == false) {
      visble = true;
      emit(VisablityState());
    }
    else {
      visble = false;
      emit(UnvisablityState());
    }
  }

  String? validateConfirmPassword(String? value) {
    emit(SignupVaildatorRePasswordLoadingState());
    if (value!.isEmpty) return 'Empty';
    if (value != pass) {
      emit(SignupVaildatorRePasswordErrorState());
      return 'Not Match';
    }
    else if(value == pass){
      emit(SignupVaildatorRePasswordSuccsesState());
      return null;
    }
  }

  String? validateMobile(String? value) {
// Indian Mobile number are of 10 digit only
    if (value!.length != 11) {
      return 'Mobile Number must be of 10 digit';
    } else {
      return null;
    }
  }
  CollectionReference<UserModel> getUserColletion() {
    return FirebaseFirestore.instance.collection('Users').withConverter(
      fromFirestore: (snapshot, _) {
        return UserModel.fromjson(snapshot.data()!);
      },
      toFirestore: (value, options) {
        return value.Tojson();
      },);
  }
  singup(String Email,String password,Function Nav)async{
    {
      emit(SignupLoadingState());
      FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: Email,
        password: password,
      ).then((userCredential) {
        UserModel user=UserModel(
            id: userCredential.user!.uid,
            Email: Email);
        var Collection= getUserColletion();
        var docRef=Collection.doc(userCredential.user!.uid);
        docRef.set(user);
         Future.delayed(Duration(seconds: 3),() {
          emit(SignupSuccsesState());
        Nav();
        },);
      },).catchError((e){
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
        emit(SignupErrorState(e.toString()));
      });
    }
  }
  setProfileNameValidation(String text) {
    firstName = text;
    if (firstName.length >= 4) {
      emit(SetProfileNameSuccsesValidationState());
      return null;
    }
    emit(SetProfileNameErrorValidationState());
  }

  setProfileLastNameValidation(String text) {
    LastName = text;
    if (LastName.length >= 4) {
      emit(SetProfileLastNameSuccsesValidationState());
      return null;
    }
    emit(SetProfileNameErrorValidationState());
  }

  void pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      userImgFile = File(image.path);
      emit(SetProfilePictureSuccsesUploadState());
    }
    emit(SetProfilePictureErrorUploadState());
  }

  Future<String> imageToFirebaseStorage() async {
    Reference imageRef =
    FirebaseStorage.instance.ref(basename(userImgFile!.path));
    await imageRef.putFile(userImgFile!);
    emit(SetProfilePictureSuccsesUploadToFirebaseState());
    return await imageRef.getDownloadURL();
  }
  UpdateUserFirebaseData(String fullName,String address,String No,BuildContext context) async {
    emit(ProfileLoadingState());
    userImgFileUrl= await imageToFirebaseStorage();
    return users.doc(FirebaseAuth.instance.currentUser!.uid).update(
        {"fullName": fullName,
          "address": address,
          "phoneNo": No,
          "profileImage": userImgFileUrl
        }).then((value) {
      emit(SetProfileSuccsesState());
      Future.delayed(Duration(seconds: 3),
      () {
        Navigator.pushNamedAndRemoveUntil(context, StartPage.routeName, (route) => false);
      },);
    },).catchError((e){
      print(e.toString());
    });
  }
  login( String emailAddress, String password, BuildContext context) async {
    emit(LoadingLoginState());
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: emailAddress, password: password)
        .then((credential) async {
          Future.delayed(Duration(seconds: 4),
          () {
            emit(SuccsesLoginState());
            Navigator.pushNamedAndRemoveUntil(context, StartPage.routeName, (route) => false);
          },);
        }).catchError((e) {
      emit(ErrorLoginState());
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    });}
}
