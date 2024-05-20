import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../../../../Utilites/colors.dart';
import '../Login & Register/login screen.dart';

class IntroductionScreens extends StatefulWidget {
  const IntroductionScreens({Key? key}) : super(key: key);

  @override
  State<IntroductionScreens> createState() => _IntroductionScreensState();
}

class _IntroductionScreensState extends State<IntroductionScreens> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body:
        IntroductionScreen(
            pages: [
              PageViewModel(
                title: 'your skin is our passion',
                body: 'at DermEase,we believe that every one deserves to have healthy ,beautiful skin,our team of experienced dermatolgists is here to help you find the right solution for your individual needs',
                image: buildImage("lib/assets/images/on1.png"),
                //getPageDecoration, a method to customise the page style
                decoration: getPageDecoration(),
              ),

              PageViewModel(
                title: 'what can  DermEase do for you ?',
                body: 'DermEase offers a wide range of dermatological service ,including ,acne treatment ,Eczema ,treatment ,skin cancer screening and more!',
                image: buildImage("lib/assets/images/on2.png"),
                //getPageDecoration, a method to customise the page style
                decoration: getPageDecoration(),
              ),
              PageViewModel(
                title: 'How does DermEase work?',
                body: 'DermEase is convenient and affordable way to get dermatological care ,simply book a consultation online ,and our team of experienced dermatologists will assess your skin condition and recommend a treatment plan',
                image: buildImage("lib/assets/images/on3.png"),
                //getPageDecoration, a method to customise the page style
                decoration: getPageDecoration(),
              ),
            ],
            onDone: () {
              if (kDebugMode) {
                print("Done clicked");
              }
            },
            //ClampingScrollPhysics prevent the scroll offset from exceeding the bounds of the content.
            scrollPhysics: const ClampingScrollPhysics(
            ),
            showDoneButton: true,
            showNextButton: true,
            showSkipButton: true,

            skipStyle: const ButtonStyle(

            ),
            //isBottomSafeArea: true,
            showBottomPart: true,
            dotsDecorator: const DotsDecorator(
              color: Colors.white,
              activeColor: Colors.grey,
            ),
            globalBackgroundColor: ToolsUtilites.primarycolor,
            overrideSkip: TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()));
              },
              child: Text("skip", style: GoogleFonts.inter(
                color: Colors.white,
              ),),
            ),
            next: const Icon(Icons.forward,color: Colors.white,),
            done:
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()));
              },

              child: Text("skip", style: GoogleFonts.inter(
                color: Colors.white,
              ),),
            )
        ));
  }

  Widget buildImage(String imagePath) {
    return Center(
        child: Image.asset(
          imagePath,
         width: 400,
          height: 990,
        ));
  }

  //method to customise the page style
  PageDecoration getPageDecoration() {
    return PageDecoration(
      imagePadding: const EdgeInsets.only(top: 80, left: 40, right: 40),
      imageAlignment: Alignment.center,
      titleTextStyle: GoogleFonts.inter(
          fontSize: 35,
          color: Colors.white,



      ),
      pageColor: const Color(0xff427D9D),
      bodyPadding: const EdgeInsets.only(top: 8, left: 30, right: 30),
      titlePadding: const EdgeInsets.only(top: 50),
      bodyTextStyle: GoogleFonts.inter(
          fontSize: 16,
          color: Colors.white,



      ),
    );
  }

  //method to customize the dots style
  DotsDecorator getDotsDecorator() {
    return const DotsDecorator(
      spacing: EdgeInsets.symmetric(horizontal: 4),
      activeColor: Colors.grey,
      color: Colors.white,
      activeSize: Size(7, 7),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(30.0),

        ),
      ),
    );
  }
}

