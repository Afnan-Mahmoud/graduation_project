import 'package:flutter/material.dart';
class CustomSearchDelegate extends StatefulWidget {
  const CustomSearchDelegate({super.key});

  @override
  State<CustomSearchDelegate> createState() => _CustomSearchDelegateState();
}

class _CustomSearchDelegateState extends State<CustomSearchDelegate> {
  @override
  Widget build(BuildContext context) {
    List<String> searchTerms=[
      "Actinic keratoses",
      "Basal cell carcinoma",
      "Benign keratosis-like lesions",
      "Dermatofibroma",
      "Melanocytic nevi",
      "Melanoma",
      "Vascular lesions",
    ];
    return const Placeholder();
  }
}