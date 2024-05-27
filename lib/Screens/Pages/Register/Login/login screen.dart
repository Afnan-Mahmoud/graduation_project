import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/Screens/Pages/Register/registerCubit/register_cubit.dart';
import 'package:graduation_project/Screens/Pages/Start%20Page/startpage.dart';
import 'package:http/http.dart';
import 'package:lottie/lottie.dart';
import '../SignUp/Signup.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "LoginScreen";

  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passToggle = true;

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  get primarycolor => null;

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return "* Required";
    } else if (value.length < 6) {
      return "Password should be at least 6 characters";
    } else if (value.length > 15) {
      return "Password should not be greater than 15 characters";
    } else
      return null;
  }

  void login(String email, password) async {
    try {
      Response response = await post(
        Uri.parse('https://skindiseas.azurewebsites.net/api/Accounts/login'),
        body: {"email": email, "password": password},
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data['token']);
        print('Login successfully');
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        builder: (context, state) {
          return Scaffold(
              body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 120, left: 8, right: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "LOGIN",
                    style: GoogleFonts.inter(
                      fontSize: 24,
                      fontWeight: FontWeight.w200,
                      color: primarycolor,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Form(
                      key: formkey,
                      child: TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                          labelText: 'Email',
                          counterStyle: TextStyle(color: Colors.grey),
                          hintText: 'Enter your Email id as abc@gmail.com',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextFormField(
                      obscureText: passToggle,
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        labelText: 'Password',
                        hintText: 'Enter secure Password',
                        suffixIcon: InkWell(
                          onTap: () {
                            Color(0xff668983);
                            setState(() {
                              passToggle = !passToggle;
                            });
                          },
                          child: Icon(passToggle
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
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
                              'Log in ',
                              style:
                                  TextStyle(color: primarycolor, fontSize: 12),
                            ),
                            onPressed: () async {
                              if (formkey.currentState!.validate()) {
                                // If the form is valid, attempt login
                                login(emailController.text.toString(),
                                    passwordController.text.toString());
                                // if (emailController.text == "ReemTester@gmail.com" &&
                                //     passwordController.text == "Ayman#12345678") {
                                //   Navigator.pushNamedAndRemoveUntil(context, StartPage.routeName,(route) => false,);
                                //   // If login is successful, navigate to the homepage
                                // } else {
                                //   // If login fails, show an error message
                                //   ScaffoldMessenger.of(context).showSnackBar(
                                //     const SnackBar(content: Text('Login failed. Please check your email or password.')),
                                RegisterCubit.get(context).login(
                                    emailController.text,
                                    passwordController.text,
                                    context);
                              }

                            }),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Center(
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 69),
                            child: Text('Dont have an account? ',
                                style: TextStyle(
                                    color: primarycolor, fontSize: 14)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 6.0),
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, SignupScreen.routeName);
                                },
                                child: Text(
                                  'Sign up',
                                  style: TextStyle(
                                      fontSize: 14, color: primarycolor),
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 2,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ));
        },
        listener: (context, state) {
          if(state is LoadingLoginState){
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
        },
      ),
    );
  }
}
