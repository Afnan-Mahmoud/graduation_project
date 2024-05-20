import 'package:flutter/material.dart';

import 'info_home_circlel-ist/actinic_keratoses.dart';
import 'info_home_circlel-ist/basal_cell_carcinoma.dart';
import 'info_home_circlel-ist/benign_keratosis-like lesions.dart';
import 'info_home_circlel-ist/dermatofibroma.dart';
import 'info_home_circlel-ist/melanocytic_nevi.dart';
import 'info_home_circlel-ist/melanoma.dart';
import 'info_home_circlel-ist/vascular_lesions.dart';

class CircleListItem extends StatefulWidget {
  const CircleListItem({super.key});

  @override
  State<CircleListItem> createState() => _CircleListItemState();
}
class _CircleListItemState extends State<CircleListItem> {
  @override
  Widget build(BuildContext context) {
    final currentContext = context; // Store the context

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            _buildCircleImage1(currentContext), // Pass the context
            _buildText1(),
          ],
        ),
        Column(
          children: [
            _buildCircleImage2(currentContext), // Pass the context
            _buildText2(),
          ],
        ),
        Column(
          children: [
            _buildCircleImage3(currentContext), // Pass the context
            _buildText3(),
          ],
        ),
          Column(
          children: [
          _buildCircleImage4(currentContext), // Pass the context
          _buildText4(),
          ],
          ),
          Column(
          children: [
          _buildCircleImage5(currentContext), // Pass the context
          _buildText5(),
          ]
          ),
        Column(
            children: [
              _buildCircleImage6(currentContext), // Pass the context
              _buildText6(),
            ]
        ),
        Column(
            children: [
              _buildCircleImage7(currentContext), // Pass the context
              _buildText7(),
            ]
        ),
      ]);
  }
}

Widget _buildCircleImage1(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 9),
    child: InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Melanocytic_nevi_H()),
        );
      },
      child: Container(
        height: 75,
        width: 75,
        padding: const EdgeInsets.all(0.5),
        decoration: BoxDecoration(
          color: const Color(0xff00000040),
          border: Border.all(
            color: Colors.transparent,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(50.0)),
        ),
        child: ClipOval(
          child: Image.asset(
            "lib/assets/images/melanocytic3.png"
          ,fit: BoxFit.cover,
          ),
        ),
      ),
    ),
  );
}

Widget _buildText1(){
  return const Text(
    'Melanocytic',
    style: TextStyle(fontWeight: FontWeight.w400
    ),
  );
}


Widget _buildCircleImage2(BuildContext context){
  return Padding(padding: const EdgeInsets.symmetric(horizontal: 9,vertical: 9),
  child: InkWell(
  onTap: (){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Benign_keratosis_H()),
    );
  },
    child: Container(
      height: 75,
      width: 75,
      padding: const EdgeInsets.all(0.5),
      decoration:  BoxDecoration(
          color: const Color(0xff00000040),
          border:  Border.all(
            color: Colors.transparent,

          ),
          borderRadius:  const BorderRadius.only(
            topLeft:  Radius.circular(50.0),
            topRight:  Radius.circular(50.0),
            bottomLeft:  Radius.circular(50.0),
            bottomRight:  Radius.circular(50.0),
          )),
      child: ClipOval(
        child: Image.asset(
          "lib/assets/images/benign.png",fit: BoxFit.cover,
        ),
      ),
    ),
  ));
}

Widget _buildText2(){
  return const Text(
    'BKL',
    softWrap: true,
    style: TextStyle(fontWeight: FontWeight.w400
    ),

  );
}

Widget _buildCircleImage3(BuildContext context){
  return Padding(padding: const EdgeInsets.symmetric(horizontal: 9,vertical: 9),
      child: InkWell(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Vascular_lesions_H()),
          );
        },
        child: Container(
          height: 75,
          width: 75,
          padding: const EdgeInsets.all(0.5),
          decoration:  BoxDecoration(
              color: const Color(0xff00000040),
              border:  Border.all(
                color: Colors.transparent,

              ),
              borderRadius:  const BorderRadius.only(
                topLeft:  Radius.circular(50.0),
                topRight:  Radius.circular(50.0),
                bottomLeft:  Radius.circular(50.0),
                bottomRight:  Radius.circular(50.0),
              )),
          child: ClipOval(
            child: Image.asset(
              "lib/assets/images/Vascular-Lesions.jpg",fit: BoxFit.cover,
            ),
          ),
        ),
      ));
}

Widget _buildText3(){
  return const Text(
    'Vascular lesions',
    style: TextStyle(fontWeight: FontWeight.w400
    ),
  );
}


Widget _buildCircleImage4(BuildContext context){
  return Padding(padding: const EdgeInsets.symmetric(horizontal: 9,vertical: 9),
      child: InkWell(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Basal_cell_H()),
          );
        },
        child: Container(
          height: 75,
          width: 75,
          padding: const EdgeInsets.all(0.5),
          decoration:  BoxDecoration(
              color: const Color(0xff00000040),
              border:  Border.all(
                color: Colors.transparent,

              ),
              borderRadius:  const BorderRadius.only(
                topLeft:  Radius.circular(50.0),
                topRight:  Radius.circular(50.0),
                bottomLeft:  Radius.circular(50.0),
                bottomRight:  Radius.circular(50.0),
              )),
          child: ClipOval(
            child: Image.asset(
              "lib/assets/images/cell2.jpg",fit: BoxFit.cover,
            ),
          ),
        ),
      ));
}

Widget _buildText4(){
  return const Text(
    'BCC',
    style: TextStyle(fontWeight: FontWeight.w400
    ),
  );
}

Widget _buildCircleImage5(BuildContext context){
  return Padding(padding: const EdgeInsets.symmetric(horizontal: 9,vertical: 9),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Melanoma_H()),
          );
        },
        child: Container(
          height: 75,
          width: 75,
          padding: const EdgeInsets.all(0.5),
          decoration:  BoxDecoration(
              color: const Color(0xff00000040),
              border:  Border.all(
                color: Colors.transparent,

              ),
              borderRadius:  const BorderRadius.only(
                topLeft:  Radius.circular(50.0),
                topRight:  Radius.circular(50.0),
                bottomLeft:  Radius.circular(50.0),
                bottomRight:  Radius.circular(50.0),
              )),
          child: ClipOval(
            child: Image.asset(
              "lib/assets/images/Melanoma2.jpg",fit: BoxFit.cover,
            ),
          ),
        ),
      ));
}

Widget _buildText5(){
  return const Text(
    'Melanoma',
    style: TextStyle(fontWeight: FontWeight.w400
    ),
  );
}



Widget _buildCircleImage6(BuildContext context){
  return Padding(padding: const EdgeInsets.symmetric(horizontal: 9,vertical: 9),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Actinic_keratoses_H()),
          );
        },
    child: Container(
      height: 75,
      width: 75,
      padding: const EdgeInsets.all(0.5),
      decoration:  BoxDecoration(
          color: const Color(0xff00000040),
          border:  Border.all(
            color: Colors.transparent,

          ),
          borderRadius:  const BorderRadius.only(
            topLeft:  Radius.circular(50.0),
            topRight:  Radius.circular(50.0),
            bottomLeft:  Radius.circular(50.0),
            bottomRight:  Radius.circular(50.0),
          )),
      child: ClipOval(
        child: Image.asset(
          "lib/assets/images/Actinic.jpeg",fit: BoxFit.cover,
        ),
      ),
    ),
  ));
}

Widget _buildText6(){
  return const Text(
    'AK',
    style: TextStyle(fontWeight: FontWeight.w400
    ),
  );
}

Widget _buildCircleImage7(BuildContext context){
  return Padding(padding: const EdgeInsets.symmetric(horizontal: 9,vertical: 9),
  child: InkWell(
  onTap: (){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Dermatofibroma_H()),
    );
  },
    child: Container(
      height: 75,
      width: 75,
      padding: const EdgeInsets.all(0.5),
      decoration:  BoxDecoration(
          color: const Color(0xff00000040),
          border:  Border.all(
            color: Colors.transparent,

          ),
          borderRadius:  const BorderRadius.only(
            topLeft:  Radius.circular(50.0),
            topRight:  Radius.circular(50.0),
            bottomLeft:  Radius.circular(50.0),
            bottomRight:  Radius.circular(50.0),
          )),
      child: ClipOval(
        child: Image.asset(
          "lib/assets/images/Dermatofibroma.png",fit: BoxFit.cover,
        ),
      ),
    ),
  ));
}

Widget _buildText7() {
  return const Text(
    'Dermatofibroma',
    style: TextStyle(fontWeight: FontWeight.w400
    ),
  );
}