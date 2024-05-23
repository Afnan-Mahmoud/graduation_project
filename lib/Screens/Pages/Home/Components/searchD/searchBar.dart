import 'package:flutter/material.dart';
import '../../../../../Utilites/colors.dart';

class searchBar extends StatefulWidget {
  final Function(String) onSearch;
  final FocusNode searchFocusNode;
  searchBar({required this.onSearch, required this.searchFocusNode});
  @override
  State<searchBar> createState() => _searchBarState();
}

class _searchBarState extends State<searchBar> {
  final TextEditingController _controller = TextEditingController();

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
            controller: _controller,
            focusNode: widget.searchFocusNode,
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
