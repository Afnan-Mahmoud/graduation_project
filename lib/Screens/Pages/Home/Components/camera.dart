import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../../../../Utilites/colors.dart';
import '../../Diseases result/resultpage.dart';
File? globalImage=File("");

class Camera_view extends StatefulWidget {
  const Camera_view({Key? key});

  @override
  State<Camera_view> createState() => _Camera_viewState();
}

class _Camera_viewState extends State<Camera_view> {
  Uint8List? _image;
  File? imageFile;
  bool showSpinner = false ;

  _showOption(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Make a choice",
          style: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),

        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text("Gallery"),
                onTap: () => _pickImageFromGallery(),
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt_outlined),
                title: const Text("Camera"),
                onTap: () => _pickImageFromCamera(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future _pickImageFromGallery() async {
    final returnImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {

    });

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Result()),
    ); // Close the dialog
  }

  Future _pickImageFromCamera() async {
    final returnImage =
    await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      imageFile = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();

    });

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Result()),
    );  // Close the dialog
  }
  Future<void> uploadImage ()async{

    setState(() {
      showSpinner = true ;
    });

    var stream  = new http.ByteStream(imageFile!.openRead());
    stream.cast();

    var length = await imageFile!.length();

    var uri = Uri.parse('https://fakestoreapi.com/products');

    var request = new http.MultipartRequest('POST', uri);

    request.fields['title'] = "Static title" ;

    var multiport = new http.MultipartFile(
        'image',
        stream,
        length);

    request.files.add(multiport);

    var response = await request.send() ;

    print(response.stream.toString());
    if(response.statusCode == 200){
      setState(() {
        showSpinner = false ;
      });
      print('image uploaded');
    }else {
      print('failed');
      setState(() {
        showSpinner = false ;
      });

    }

  }



  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Align(
          alignment: Alignment.bottomRight,
          child: FloatingActionButton(
            shape: const CircleBorder(),
            backgroundColor: const Color(0xffBED7DC),
            tooltip: 'Take Picture',
            onPressed: () => _showOption(context),
            child: const Padding(
              padding: EdgeInsets.all(12.0),
              child: Icon(
                Icons.camera_alt_rounded,
                color: ToolsUtilites.primarycolor,
                size: 22,
              ),
            ),
          ),
        ),

        if (imageFile != null) Image.file(imageFile!),
      ],
    );
  }
}





