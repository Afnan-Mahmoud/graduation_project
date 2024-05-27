import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/Screens/Pages/Register/registerCubit/register_cubit.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:lottie/lottie.dart';

class SetProfileScreen extends StatelessWidget {
  static const String routeName = 'SetProfileScreen';

  SetProfileScreen({super.key});

  final TextEditingController firstName = TextEditingController();
  final TextEditingController LastName = TextEditingController();
  final TextEditingController PhoneNo = TextEditingController();
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocProvider<RegisterCubit>(create: (context) => RegisterCubit(),
            child: BlocConsumer<RegisterCubit, RegisterState>(
              builder: (context, state) {
                return SingleChildScrollView(
                  child: Form(
                    key: formkey,
                    autovalidateMode:AutovalidateMode.always ,
                    child: Padding(
                      padding: EdgeInsets.only(top: 30, left: 33, right: 33),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Profile',
                                    style: TextStyle(
                                      color: Color(0xFF1E1E1E),
                                      fontSize: 20,
                                      fontFamily: 'San Francisco Display',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Text(
                                    'Please set up your profile',
                                    style: TextStyle(
                                      color: Color(0xFFC4C4C4),
                                      fontSize: 16,
                                      fontFamily: 'San Francisco Display',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      RegisterCubit.get(context).pickImage();
                                    },
                                    child: Container(
                                      width: 135,
                                      height: 135,
                                      decoration: const ShapeDecoration(
                                        color: Color(0xff427D9D),
                                        shape: OvalBorder(),
                                      ),
                                      child: RegisterCubit.get(context).userImgFile !=null? CircleAvatar(
                                        backgroundImage: FileImage(RegisterCubit.get(context).userImgFile!),
                                      ):const ImageIcon(
                                        AssetImage('lib/assets/images/upload.png'),
                                        size: 25,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 60,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Full Name',
                                    style: TextStyle(
                                      color: const Color(0xFF878787),
                                      fontSize: 14,
                                      fontFamily: 'San Francisco Display',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                ],
                              ),
                              TextFormField(
                                  controller: firstName,
                                  style: TextStyle(color: Colors.black),
                                  onChanged: (value) {
                                    RegisterCubit.get(context)
                                        .setProfileNameValidation(
                                        firstName.text);
                                  },
                                  decoration: InputDecoration(
                                      suffixIcon: firstName.text.isNotEmpty
                                          ?  RegisterCubit.get(context).firstName.length>=4
                                          ?
                                      Container(
                                          margin: EdgeInsets.only(
                                              top: 10, bottom: 10, right: 10, left: 10
                                          ),
                                          decoration: ShapeDecoration(
                                            color: Color(0xFF5063BF),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(
                                                  20),
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.done, color: Colors.white,
                                            size: 15,))
                                          : Container(
                                          margin: EdgeInsets.only(
                                              top: 10, bottom: 10, right: 10, left: 10
                                          ),
                                          decoration: ShapeDecoration(
                                            color: Colors.red,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(
                                                  20),
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.close_rounded, color: Colors.white,size: 15,
                                            )):SizedBox(),
                                      hintText: "John Snow",
                                      hintStyle: TextStyle(
                                          color: Color(0xFFC4C4C4),
                                          fontSize: 15,
                                          fontFamily: 'San Francisco Display',
                                          fontWeight: FontWeight.w500),
                                      border: const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black)
                                      )
                                  )
                              ),
                            ],
                          ),
                          SizedBox(height: 25,),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Address',
                                    style: TextStyle(
                                      color: const Color(0xFF878787),
                                      fontSize: 14,
                                      fontFamily: 'San Francisco Display',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                ],
                              ),
                              TextFormField(
                                  style: TextStyle(color: Colors.black),
                                  controller: LastName,
                                  onChanged: (value) {
                                    RegisterCubit.get(context)
                                        .setProfileLastNameValidation(
                                        LastName.text);
                                  },
                                  decoration: InputDecoration(
                                      suffixIcon: LastName.text.isNotEmpty
                                          ? RegisterCubit.get(context).LastName.length>=10
                                          ?
                                      Container(
                                          margin: EdgeInsets.only(
                                              top: 10, bottom: 10, right: 10, left: 10
                                          ),
                                          decoration: ShapeDecoration(
                                            color: Color(0xFF5063BF),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(
                                                  20),
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.done, color: Colors.white,
                                            size: 15,))
                                          : Container(
                                          margin: EdgeInsets.only(
                                              top: 10, bottom: 10, right: 10, left: 10
                                          ),
                                          decoration: ShapeDecoration(
                                            color: Colors.red,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(
                                                  20),
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.close_rounded, color: Colors.white,size: 15,
                                          )):
                                      SizedBox(),
                                      hintText: 'abc address, xyz city',
                                      hintStyle: TextStyle(
                                          color: Color(0xFFC4C4C4),
                                          fontSize: 15,
                                          fontFamily: 'San Francisco Display',
                                          fontWeight: FontWeight.w500),
                                      border: const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black)
                                      )
                                  )
                              ),
                            ],
                          ),
                          SizedBox(height: 25,),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '* Phone Number',
                                    style: TextStyle(
                                      color: const Color(0xFF878787),
                                      fontSize: 13,
                                      fontFamily: 'San Francisco Display',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                ],
                              ),
                              IntlPhoneField(
                                  style: TextStyle(color: Colors.black),
                                  controller: PhoneNo,
                                  initialCountryCode: "20",
                                  keyboardType: TextInputType.phone,
                                  onChanged: (value) {
                                  },
                                  decoration: InputDecoration(
                                      suffixIcon: PhoneNo.text.isNotEmpty
                                          ?  PhoneNo.text.length==11
                                          ?
                                      Container(
                                          margin: EdgeInsets.only(
                                              top: 10, bottom: 10, right: 10, left: 10
                                          ),
                                          decoration: ShapeDecoration(
                                            color: const Color(0xFF5063BF),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(
                                                  20),
                                            ),
                                          ),
                                          child: const Icon(
                                            Icons.done, color: Colors.white,
                                            size: 15,))
                                          : Container(
                                          margin: EdgeInsets.only(
                                              top: 10, bottom: 10, right: 10, left: 10
                                          ),
                                          decoration: ShapeDecoration(
                                            color: Colors.red,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(
                                                  20),
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.close_rounded, color: Colors.white,size: 15,
                                          )):SizedBox(),
                                      hintText: '8456 5846 5846',
                                      hintStyle: TextStyle(
                                          color: Color(0xFFC4C4C4),
                                          fontSize: 14,
                                          fontFamily: 'San Francisco Display',
                                          fontWeight: FontWeight.w500),
                                      border: const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black)
                                      )
                                  )
                              ),
                            ],
                          ),
                          SizedBox(height: 50,),
                          ElevatedButton(
                              onPressed: () {
                            RegisterCubit.get(context).imageToFirebaseStorage();
                            RegisterCubit.get(context).UpdateUserFirebaseData(firstName.text, LastName.text,PhoneNo.text,context);
                          },
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(133, 60),
                                backgroundColor: const Color(0xff427D9D),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Set',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontFamily: 'San Francisco Display',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                );
              }
              , listener: (context, state) {
              if (state is SetProfileSuccsesState) {
                Navigator.pop(context);
                showDialog(context: context, builder: (context) {
                  return Center(
                    child: Lottie.asset("lib/assets/animations/Done.json",
                        width: 300,height: 300,
                        frameRate: FrameRate(10),
                    ),
                  );
                },);
              }
              if (state is ProfileLoadingState) {
                showDialog(context: context, builder: (context) {
                  return Center(
                    child: Container(
                      width: 110,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withOpacity(.7),
                      ),
                      child: Center(
                        child: Lottie.asset("lib/assets/animations/Loading.json",
                            width: 200,
                            height: 120,
                            frameRate: FrameRate(10),
                            repeat: true
                        ),
                      ),
                    ),
                  );
                },);
              }
            },)),
      ),
    );
  }
}
