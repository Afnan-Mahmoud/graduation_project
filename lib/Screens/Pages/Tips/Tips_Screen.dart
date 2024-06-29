import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/Screens/Pages/Start%20Page/start_page_cubit.dart';
import 'package:provider/provider.dart';
import '../../../Provider/provider.dart';
import 'info_Tips_page/Protect _skin.dart';
import 'info_Tips_page/health_nutrition.dart';
import 'info_Tips_page/skin_care_tips.dart';
import 'info_Tips_page/skin_routine.dart';
import 'info_Tips_page/skin_type.dart';


class Skin_Tips extends StatelessWidget {
  static const String routeName="SkinTips";
  const Skin_Tips({super.key});


  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tips',
      theme: ThemeData.light(), // Light theme
      darkTheme: ThemeData.dark(), // Dark theme
      themeMode: appProvider.isDarkModeEnabled
          ? ThemeMode.dark
          : ThemeMode.light, // Use themeMode to switch between light and dark mode
      home: const MyHomePage(title: ' Tips'),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppProvider.get(context).isDarkModeEnabled
              ?null:Colors.white,
          elevation: 0,
            centerTitle: true,
            title:  Text("Tips",
            style: TextStyle(
              color: AppProvider.get(context).isDarkModeEnabled
                  ?null:Colors.black
            )),
            leading: BlocBuilder<StartPageCubit,StartPageState>(builder: (context, state) {
              return IconButton(
                onPressed: (){
                  StartPageCubit.get(context).changeIndex(1);
                },

                icon:  Icon(Icons.keyboard_arrow_left,color: AppProvider.get(context).isDarkModeEnabled
                    ?null:Colors.black,),
              );
            },),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ))),
        body: Padding(
          padding: const EdgeInsets.only(top: 19.0,bottom: 11.0),


          child: GridView(
            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,childAspectRatio: 1.4,),

            children: <Widget>[

              // Fitness & Health Care
              Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(70)),
                child: Card(

                  child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Skin_Type(),));
                        },
                    child: Column(
                      children: [
                        Image.asset(
                          "lib/assets/images/Skin_Type.jpg", fit: BoxFit.scaleDown,height: 200,width: 500,),
                        Padding(
                          padding: const EdgeInsets.only(top: 0.0),
                          child:Text("Know Your Skin Type",style: GoogleFonts.handlee(
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                          ),), ),
                      ],
                    )
                ),),
              ),


              // Skin Care
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(70)),
                child: Card(

                  child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Skin_Routine(),));
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            "lib/assets/images/skin_care.png", fit: BoxFit.scaleDown,height: 215,width: 400,),
                          Padding(
                            padding: const EdgeInsets.only(top: 0.0),
                            child: Text("Routine For Health Skin",style: GoogleFonts.handlee(
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                            ),), ),
                        ],
                      )
                  ),),
              ),




              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(70)),
                child: Card(

                  child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Health_Nutrition(),));
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            "lib/assets/images/Eat_health.png", fit: BoxFit.scaleDown,height: 200,width: 400,),
                          Padding(
                            padding: const EdgeInsets.only(top: 0.0),
                            child: Text("Health nutrition For Skin",style: GoogleFonts.handlee(
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                            ),),  ),
                        ],
                      )
                  ),),
              ),



              // Skin Care Tips
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(70)),
                child: Card(

                  child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Skin_Care_Tips(),));
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            "lib/assets/images/Skincare-Tips.jpg", fit: BoxFit.scaleDown,height: 195,width: 400,),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child:  Text("Skin Care Tips",style: GoogleFonts.handlee(
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                            ),),   ),
                        ],
                      )
                  ),),
              ),


              // Protective measures for your skin
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(70)),
                child: Card(

                  child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Protect_Skin(),));
                      },

                      child: Column(
                        children: [
                          Image.asset(
                            "lib/assets/images/protect-your-skin.png", fit: BoxFit.scaleDown,height: 200,width: 400,),
                          Padding(
                            padding: const EdgeInsets.only(top: 0.0),
                            child:Text("Protect measures for your skin",style: GoogleFonts.handlee(
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                            ),),  ),
                        ],
                      )
                  ),),
              ),






            ],
          ),
        ));
  }
}