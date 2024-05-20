import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:graduation_project/Screens/index.dart';
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
  int _page = 1;
  bool _showNavigationBar = true;


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
    return Scaffold(
      // Package Of NavigationBar Take Curved shape
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: _showNavigationBar
        ?CurvedNavigationBar(
          key: _bottomNavigationKey,
          // When This page OPen It Will Open Automatically On Your Homepage
          index: index.homeScreenIndex,
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
          color: Color(0x96c5c1c1),
          buttonBackgroundColor:const Color(0xffBED7DC),
          backgroundColor: Colors.transparent,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 300),
          onTap: (index) {
            setState(() {
              _page = index;
              if (index == 3) {
    // Hide the navigation bar when settings icon is clicked
          _showNavigationBar = false;
    }
            });
          },
        ): null,
        body: tabs[_page]);
  }
}