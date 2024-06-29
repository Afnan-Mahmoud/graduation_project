import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/Screens/Pages/Start%20Page/start_page_cubit.dart';
import '../../../../Utilites/colors.dart';
import '../Chatbot/chat.dart';
import '../Home/HomeScreen.dart';
import '../Profile/personalpage.dart';
import '../Tips/Tips_Screen.dart';



class StartPage extends StatefulWidget {
  static CurvedNavigationBarState? currentState;
  static const String routeName="StartPage";

  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {

  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    //The Page That Appears When You Click In Icons Like
    //Home
    //Profile
    //Chat
    List<Widget> tabs = [
      const Skin_Tips(),
      const Homepage(),
      const PersonalPage(),
      ChatPage(),
    ];
    return BlocProvider(create: (context) => StartPageCubit()..getProfileDataFromFirebase(),child:
    BlocBuilder<StartPageCubit,StartPageState>(builder: (context, state) {
      return Scaffold(
        // Package Of NavigationBar Take Curved shape
          resizeToAvoidBottomInset: false,
          bottomNavigationBar: StartPageCubit.get(context).bottomNavigationCheck
              ?CurvedNavigationBar(
            key: _bottomNavigationKey,
            // When This page OPen It Will Open Automatically On Your Homepage
            index: StartPageCubit.get(context).index,
            items: const [
              CurvedNavigationBarItem(
                child: Icon(
                  Icons.tips_and_updates,
                  size: 20,
                  color: ToolsUtilites.primarycolor,
                ),
                label: 'Tips',
              ),

              CurvedNavigationBarItem(
                child: Icon(Icons.home_outlined,
                    size: 20, color:ToolsUtilites.primarycolor),
                label: 'Home',
              ),
              CurvedNavigationBarItem(
                child: Icon(Icons.perm_identity,
                    size: 20, color: ToolsUtilites.primarycolor),
                label: 'Personal',
              ),
              CurvedNavigationBarItem(
                child: Icon(Icons.chat, size: 20, color: ToolsUtilites.primarycolor),
                label: 'Chat',
              ),
            ],
            // The Properties Of NavigationBar
            color: Color(0xFF141F33),
            buttonBackgroundColor:const Color(0xff298AE1),
            backgroundColor: Colors.transparent,
            animationCurve: Curves.easeInOut,
            animationDuration: const Duration(milliseconds: 300),
            onTap: (index) {
              setState(() {
                StartPageCubit.get(context).changeIndex(index);
                if (index == 3) {
                  // Hide the navigation bar when settings icon is clicked
                  StartPageCubit.get(context).changeBottomNavigationCheck(false);
                }
              });
            },
          ): null,
          body: tabs[StartPageCubit.get(context).index]);
    },),);
  }
}