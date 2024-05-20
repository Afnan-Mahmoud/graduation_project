import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Start Page/startpage.dart';
import '../../../../Utilites/colors.dart';

class SignupScreen extends StatefulWidget with InputValidationMixin {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreen();
}

class _SignupScreen extends State<SignupScreen> {
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();



  @override
  Widget build(BuildContext context) {

    return  Expanded(child: Scaffold(
    resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[
              Text(
                "Create Account",
                style: GoogleFonts.inter(
                  fontSize: 24,
                  fontWeight: FontWeight.w300,
                  color: ToolsUtilites.primarycolor,
                ),
              ),
              const SizedBox(
                height: 50,
              ),

              Padding(
                padding:  const EdgeInsets.all(15),
                child: TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    labelText: 'Full Name',
                    counterStyle: const TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (email) {
                    if (!(email!.contains('@')) && email.isNotEmpty) {
                      return "Enter a valid email address!";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    labelText: 'Email',
                    counterStyle: const TextStyle(color: Colors.grey),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(15),
                child: TextFormField(
                  controller:_pass,
                  validator: (val){
                    if(val!.isEmpty) {
                      return 'Empty';
                    }
                    return null;
                  } ,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.visibility_off),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextFormField(
                  controller: _confirmPass,
                  validator: (val){
                    if(val!.isEmpty) {
                      return 'Empty';
                    }
                    if(val != _pass.text) {
                      return 'Not Match';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    labelText: 'Confirm Paasword ',
                    counterStyle: const TextStyle(color: Colors.grey),

                  ),
                ),
              ),
              SizedBox(

                child: Padding(
                  padding: const EdgeInsets.all(15),

                    child: OutlinedButton(
                      style:
                      OutlinedButton.styleFrom(
                          minimumSize: const Size.fromHeight(50),
                          shape:

                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                              side: const BorderSide(color: Colors.black38))),
                    child: const Text(
                      'Log in ',
                      style: TextStyle(color: ToolsUtilites.primarycolor, fontSize: 12),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const StartPage()),
                      );

                    },
                ),
                                ),
                ),







                ],
              )



          ),
        ));
  }
}

mixin InputValidationMixin {
  bool isValidPassword(String password) => password.length == 6;
}
