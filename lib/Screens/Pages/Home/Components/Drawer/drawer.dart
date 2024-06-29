import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/Provider/provider.dart';
import 'package:graduation_project/Screens/Pages/Start%20Page/start_page_cubit.dart';
import 'package:graduation_project/Utilites/colors.dart';

import 'package:provider/provider.dart';

class DrawerD extends StatefulWidget {
  @override
  _DrawerDState createState() => _DrawerDState();
}

class _DrawerDState extends State<DrawerD> {
  bool showSettingsSublist = false;
  final bool showDrawer = true;
  @override
  Widget build(BuildContext context) {

    AppProvider appProvider = Provider.of<AppProvider>(context);
    return BlocBuilder<StartPageCubit,StartPageState>(builder: (context, state) {
      return Stack(
        children: [
          // Your main content
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 50,
                child: FlatButton(
                  color: Colors.grey,
                  // open the drawer
                  onPressed: () {
                    _toggleDrawerVisibility();
                  },
                  child: Center(
                    child: Text('Open Drawer'),
                  ),
                ),
              ),
            ),
          ),
          // Drawer
          Align(
            alignment: Alignment.centerLeft,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: showSettingsSublist ? 180 : 180, // Set your desired width
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(showSettingsSublist ? 250 : 250),
                  bottomRight: Radius.circular(showSettingsSublist ? 250 : 250),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 55,
                      backgroundImage: NetworkImage(StartPageCubit.get(context).userModel.profileImage??""),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          StartPageCubit.get(context).changeIndex(2);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.perm_identity, color: ToolsUtilites.primarycolor,
                              ),
                              SizedBox(width: 13,),
                              Text(
                                "Profile",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: ToolsUtilites.primarycolor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            _toggleDrawerVisibility();
                          },
                          icon: const Icon(Icons.settings, color: ToolsUtilites.primarycolor),
                        ),
                        Text(
                          "Settings",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: ToolsUtilites.primarycolor,
                          ),
                        ),
                      ],
                    ),
                    if (showSettingsSublist) ...[
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              _toggleDrawerVisibility();
                            },
                            icon: Icon(Icons.subdirectory_arrow_right, color: ToolsUtilites.primarycolor),
                          ),
                          Text(
                            "Dark Mode",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: ToolsUtilites.primarycolor,
                            ),
                          ),
                          Transform.scale(
                            scale: 0.9, // Set the scale factor to adjust the size
                            child: Switch(
                              value: appProvider.isDarkModeEnabled,
                              onChanged: (value) {
                                appProvider.toggleTheme();
                              },
                              inactiveTrackColor: Colors.transparent, // Set the color of the switch when it's inactive
                              inactiveThumbColor: Colors.grey,
                              activeTrackColor: Color(0xff427d9d), // Set the color of the switch's track when it's active
                              activeColor: Colors.grey,// Set the color of the switch's thumb when it's inactive
                            ),
                          )
                        ],
                      ),
                    ],
                    Padding(
                      padding: const EdgeInsets.only(top: 240.0,left: 5),
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: () => _showOption(context,(){
                              StartPageCubit.get(context).Logout(context);
                            }),
                            child: Text(
                              'Log Out',
                              style: TextStyle(
                                color: Color(0xff427d9d), // Text color
                                fontSize: 16, // Text size
                              ),
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Color(0xffBED7DC)), // Button background color
                              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                EdgeInsets.symmetric(horizontal: 15, vertical: 10), // Padding distribution
                              ),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30), // Border radius
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    },);
  }

  void _toggleDrawerVisibility() {
    setState(() {
      showSettingsSublist = !showSettingsSublist;
    });
  }
}

FlatButton({required MaterialColor color, required Null Function() onPressed, required Center child}) {
}

_showOption(BuildContext context,Function function) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(
        "Log out of your account?",
        style: GoogleFonts.inter(
          fontSize: 17,
          fontWeight: FontWeight.w400,

        ),
      ),
      content: SingleChildScrollView(
        child: Row(
          children: <Widget>[
            Expanded(
              child: ListTile(
                title: const Text("CANCEL",
          style: TextStyle(
            fontWeight: FontWeight.w400,
           ),
                ),
                onTap: () {
                  // Dismiss the dialog when "CANCEL" is tapped
                  Navigator.of(context).pop();
                },
              ),
            ),
            Expanded(
              child: ListTile(
                title: const Text("LOG OUT",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.red,),
                ),
                onTap: () {
                  function();
                },
              ),
            ),
          ],
        ),
      ),
    ),
  );
}