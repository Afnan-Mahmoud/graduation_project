import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/Screens/Pages/Home/Components/searchD/searchBar.dart';
import 'package:graduation_project/Screens/Pages/Home/Components/sliderA.dart';
import 'package:provider/provider.dart';
import '../../../../Utilites/colors.dart';
import '../../../Provider/provider.dart';
import 'Components/camera.dart';
import 'Components/Circle list/circle_list_item.dart';
import 'Components/Drawer/drawer.dart';
bool navIsTrue=true;

class Homepage extends StatefulWidget {
  static const String routeName="Homepage";
  const Homepage({Key? key}) : super(key: key);
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  void initState() {
    super.initState();
    _scaffoldKey = GlobalKey<ScaffoldState>();
  }

  @override
  Widget build(BuildContext context) {
    AppProvider themeProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 17.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      _scaffoldKey.currentState!.openDrawer();
                      navIsTrue =false;
                    },
                    icon: const Icon(Icons.menu, color: ToolsUtilites.primarycolor),
                  ),
                  Text(
                    "DermEase",
                    style: GoogleFonts.handlee(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: ToolsUtilites.primarycolor,
                    ),
                  ),
                ],
              ),
              searchBar(onSearch: (String ) {  },),
              const SliderA(),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 0.0,left: 15),
                child: Text(
                  "About Disease",
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: ToolsUtilites.primarycolor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SizedBox(
                  height: 144,
                  child: ListView.builder(
                    itemCount: 1,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return const CircleListItem();
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: const Camera_view(),
              ),
            ],
          ),
        ),
      ),
      drawer: DrawerD(), // Adding the custom drawer
    );
  }
}



