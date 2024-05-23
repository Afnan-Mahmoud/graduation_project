import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/Screens/Pages/Home/Components/searchD/searchBar.dart';
import 'package:graduation_project/Screens/Pages/Home/Components/sliderA.dart';
import 'package:provider/provider.dart';
import '../../../../Utilites/colors.dart';
import '../../../Provider/provider.dart';
import 'Components/Circle list/info_home_circlel-ist/actinic_keratoses.dart';
import 'Components/Circle list/info_home_circlel-ist/basal_cell_carcinoma.dart';
import 'Components/Circle list/info_home_circlel-ist/benign_keratosis-like lesions.dart';
import 'Components/Circle list/info_home_circlel-ist/dermatofibroma.dart';
import 'Components/Circle list/info_home_circlel-ist/melanocytic_nevi.dart';
import 'Components/Circle list/info_home_circlel-ist/melanoma.dart';
import 'Components/Circle list/info_home_circlel-ist/vascular_lesions.dart';
import 'Components/camera.dart';
import 'Components/Circle list/circle_list_item.dart';
import 'Components/Drawer/drawer.dart';


bool navIsTrue = true;

class Homepage extends StatefulWidget {
  static const String routeName = "Homepage";
  const Homepage({Key? key}) : super(key: key);
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late GlobalKey<ScaffoldState> _scaffoldKey;
  final List<String> items = [
    "Actinic keratoses",
    "Basal cell carcinoma",
    "Benign keratosis-like lesions",
    "Dermatofibroma",
    "Melanocytic nevi",
    "Melanoma",
    "Vascular lesions"
  ];
  List<String> filteredItems = [];
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _scaffoldKey = GlobalKey<ScaffoldState>();
    filteredItems = items;
  }

  void _filterItems(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredItems = [];
      } else {
        filteredItems = items
            .where((item) => item.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void _navigateToItemPage(String item) {

    if (item == "Actinic keratoses") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  Actinic_keratoses_H()),
      );
    }

    if (item == "Basal cell carcinoma") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Basal_cell_H()),
      );
    }
    if (item == "Melanocytic nevi") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Melanocytic_nevi_H()),
      );
    }

    if (item == "Benign keratosis-like lesions") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Benign_keratosis_H()),
      );
    }
    if (item == "Dermatofibroma") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Dermatofibroma_H()),
      );
    }

    if (item == "Melanoma") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Melanoma_H()),
      );
    }
    if (item == "Vascular lesions") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Vascular_lesions_H()),
      );
    }
}

  @override
  Widget build(BuildContext context) {
    AppProvider themeProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
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
                          navIsTrue = false;
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
                  searchBar(onSearch: _filterItems, searchFocusNode: _searchFocusNode),
                  const SliderA(),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 0.0, left: 15),
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
                    child: const CameraView(),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 123, // Adjust the top position as needed
              left: 15,
              right: 15,
              child: FocusScope(
                child: Focus(
                  onFocusChange: (hasFocus) {
                    setState(() {});
                  },
                  child: _searchFocusNode.hasFocus && filteredItems.isNotEmpty
                      ? Container(
                    decoration:  BoxDecoration(
                        color: Color(0xffffffff),
                        border:  Border.all(
                          color: Colors.white,
                        ),
                        borderRadius:  const BorderRadius.only(
                          topLeft:  Radius.circular(30.0),
                          topRight:  Radius.circular(30.0),
                          bottomLeft:  Radius.circular(30.0),
                          bottomRight:  Radius.circular(30.0),
                        )),
                    child: ListView.builder(
                      itemCount: filteredItems.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(filteredItems[index]),
                          onTap: () => _navigateToItemPage(filteredItems[index]),
                        );
                      },
                    ),
                  )
                      : Container(),
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: DrawerD(),
    );
  }
}
