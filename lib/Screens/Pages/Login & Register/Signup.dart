import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/Screens/Pages/Home/HomeScreen.dart';
import 'package:graduation_project/Screens/Pages/Start%20Page/startpage.dart';
import 'package:http/http.dart' as http;

class SignupScreen extends StatefulWidget with InputValidationMixin {
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

  Future <void> registrationOfuser(String  fullName, email, password,confirmPassword) async{
    var jsonResponse ;
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
          .showSnackBar(SnackBar(content:Text(" ${jsonResponse['Message']}"))) ;

      //Or put here your next screen using Navigator.push() method
      print('success');
    } else {
      print('error');
    }



  }

  @override
  Widget build(BuildContext context) {

    return Expanded(child: Scaffold(
        body: SingleChildScrollView(
        child: Padding(
        padding: EdgeInsets.only(top: 60,left: 15,right: 15),
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

                Padding(
                  padding:  EdgeInsets.all(15),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: nameController,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      labelText: 'Full Name',
                      counterStyle: TextStyle(color: Colors.grey),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),

                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,

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
                      counterStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
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
                        child: Icon(
                            passToggle ? Icons.visibility : Icons.visibility_off),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter password";
                      } else if (passController.text.length < 6) {
                        return "Password Length Should be more than 6 characters ";
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextFormField(
                    controller: passcofirmController,
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
                        style:
                        OutlinedButton.styleFrom(
                            minimumSize: const Size.fromHeight(50),
                            shape:

                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                                side: BorderSide(color: Colors.black38))),
                        child: Text(
                          'Signup ',
                          style: TextStyle(color: primarycolor, fontSize: 12),
                        ),
                        onPressed: () async{
                          // Validate the form fields
                          if (_formfield.currentState!.validate()) {
                            registrationOfuser(emailController.text.toString(),passController
                                .text.toString()
                                ,passcofirmController.toString(),nameController.toString()
                            );
                            Navigator.pushNamedAndRemoveUntil(context, StartPage.routeName, (route) => false);
                            // If login is successful, navigate to the homepage

                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Please fill input')),
                            );
                          }

                        },
                      ),
                    ),
                  ),
                ),



              ],
            ),
          )



      ),
    )));
  }
}

mixin InputValidationMixin {
  bool isValidPassword(String password) => password.length == 6;
}