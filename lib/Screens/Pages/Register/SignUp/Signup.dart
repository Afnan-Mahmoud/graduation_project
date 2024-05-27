import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/Screens/Pages/Register/SignUp/SetProfile/SetProfileScreen.dart';
import 'package:graduation_project/Screens/Pages/Register/registerCubit/register_cubit.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class SignupScreen extends StatefulWidget{
  static const String routeName = "SignupScreen";

  @override
  State<SignupScreen> createState() => _SignupScreen();
}

class _SignupScreen extends State<SignupScreen> {
  final _formfield = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final nameController = TextEditingController();
  final passcofirmController = TextEditingController();
  bool passToggle = true;

  get primarycolor => null;

  Future<void> registrationOfuser(
      String fullName, email, password, confirmPassword) async {
    var jsonResponse;
    Map data = {
      "fullName": "ReemTester",
      "email": "ReemTester@gmail.com",
      "password": "Ayman#12345678",
      "confirmPassword": "Ayman#12345678"
    };
    print(data);

    String body = json.encode(data);
    var url = 'https://skindiseas.azurewebsites.net/api/Accounts/register';
    var response = await http.post(
      body: body,
      url as Uri,
      headers: {
        "Content-Type": "application/json",
        "accept": "application/json",
        "Access-Control-Allow-Origin": "*"
      },
    );

    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body.toString());
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(" ${jsonResponse['Message']}")));

      //Or put here your next screen using Navigator.push() method
      print('success');
    } else {
      print('error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit,RegisterState>(
          builder: (context, state) {
            return Scaffold(
                body: SingleChildScrollView(
                  child: Padding(
                      padding: EdgeInsets.only(top: 120, left: 15, right: 15),
                      child: Form(
                        key: _formfield,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Create Account",
                              style: GoogleFonts.inter(
                                fontSize: 24,
                                fontWeight: FontWeight.w300,
                                color: primarycolor,
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),

                            // Padding(
                            //   padding:  EdgeInsets.all(15),
                            //   child: TextFormField(
                            //     keyboardType: TextInputType.text,
                            //     controller: nameController,
                            //     decoration: InputDecoration(
                            //       fillColor: Colors.white,
                            //       border: OutlineInputBorder(
                            //         borderRadius: BorderRadius.circular(7),
                            //       ),
                            //       labelText: 'Full Name',
                            //       counterStyle: TextStyle(color: Colors.grey),
                            //     ),
                            //     validator: (value) {
                            //       if (value == null || value.isEmpty) {
                            //         return 'Please enter some text';
                            //       }
                            //       return null;
                            //     },
                            //   ),
                            //
                            // ),
                            Padding(
                              padding: EdgeInsets.all(15),
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                controller: emailController,
                                validator: RegisterCubit.get(context).validateEmail,
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                  labelText: 'Email',
                                  counterStyle: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.all(15),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                onChanged: (value) {
                                  RegisterCubit.get(context).pass = value;
                                  print(RegisterCubit.get(context).pass);
                                },
                                controller: passController,
                                obscureText: passToggle,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                  labelText: 'Password',
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      Color(0xff668983);
                                      setState(() {
                                        passToggle = !passToggle;
                                      });
                                    },
                                    child: Icon(passToggle
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                  ),
                                ),
                                validator:
                                RegisterCubit.get(context).validatePassword,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: TextFormField(
                                onChanged: (value) {

                                },
                                controller: passcofirmController,
                                obscureText: passToggle,
                                validator: RegisterCubit.get(context)
                                    .validateConfirmPassword,
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                  labelText: 'Confirm Paasword ',
                                  counterStyle: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                            SizedBox(
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                        minimumSize: const Size.fromHeight(50),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(7),
                                            side: BorderSide(color: Colors.black38))),
                                    child: Text(
                                      'Signup ',
                                      style: TextStyle(
                                          color: primarycolor, fontSize: 12),
                                    ),
                                    onPressed: () {
                                      // Validate the form fields
                                      if (_formfield.currentState!.validate()) {
                                        registrationOfuser(
                                            emailController.text.toString(),
                                            passController.text.toString(),
                                            passcofirmController.toString(),
                                            nameController.toString());
                                        RegisterCubit.get(context)
                                            .singup(emailController.text, passController.text, () {
                                          Navigator.pushNamedAndRemoveUntil(
                                              context,
                                              SetProfileScreen.routeName,
                                                  (route) => false);
                                        });
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                ));
          },
        listener: (context, state) {
           if (state is SignupVaildatorRePasswordErrorState) {
          }
          else if (state is SignupVaildatorRePasswordSuccsesState) {
          }
           else if (state is SignupLoadingState) {
             showDialog(
               context: context,
               builder: (context) {
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
               },
             );
           }
        },
      ),
    );
  }
}

