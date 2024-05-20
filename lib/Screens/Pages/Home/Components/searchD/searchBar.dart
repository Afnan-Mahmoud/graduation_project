import 'package:flutter/material.dart';
import '../../../../../Utilites/colors.dart';

class searchBar extends StatefulWidget {
  final Function(String) onSearch;
  searchBar({required this.onSearch});
  @override
  State<searchBar> createState() => _searchBarState();
}

class _searchBarState extends State<searchBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: ToolsUtilites.theardColor),
        ),
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: TextField(
            onChanged: widget.onSearch,
            decoration: InputDecoration(
              hintText: "Search",
              suffixIcon: Icon(Icons.add_road_rounded, color: ToolsUtilites.primarycolor),
              prefixIcon: Icon(Icons.search, color: ToolsUtilites.primarycolor),
              disabledBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              counterStyle: TextStyle(color: ToolsUtilites.primarycolor),
              focusColor: ToolsUtilites.primarycolor,
              hoverColor: ToolsUtilites.primarycolor,
              fillColor: ToolsUtilites.primarycolor,
            ),
          ),
        ),
      ),
    );
  }
}

class SearchD extends StatefulWidget {
  @override
  State<SearchD> createState() => _SearchDState();
}

class _SearchDState extends State<SearchD> {
  List<String> searchTerms = [
    "Actinic keratoses",
    "Basal cell carcinoma",
    "Benign keratosis-like lesions",
    "Dermatofibroma",
    "Melanocytic nevi",
    "Melanoma",
    "Vascular lesions",
  ];

  List<String> filteredSearchTerms = [];

  @override
  void initState() {
    filteredSearchTerms = searchTerms;
    super.initState();
  }

  void filterSearchResults(String query) {
    List<String> dummySearchList = [];
    dummySearchList.addAll(searchTerms);
    if (query.isNotEmpty) {
      List<String> dummyListData = [];
      dummySearchList.forEach((item) {
        if (item.toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      });
      setState(() {
        filteredSearchTerms.clear();
        filteredSearchTerms.addAll(dummyListData);
      });
    } else {
      setState(() {
        filteredSearchTerms.clear();
        filteredSearchTerms.addAll(searchTerms);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        searchBar(onSearch: filterSearchResults),
        Expanded(
          child: ListView.builder(
            itemCount: filteredSearchTerms.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(filteredSearchTerms[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
