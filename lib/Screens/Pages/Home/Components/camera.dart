import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../../../../Utilites/colors.dart';
import '../../Diseases result/resultpage.dart';

File? globalImage;

class CameraView extends StatefulWidget {
  const CameraView({Key? key}) : super(key: key);

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  Uint8List? _image;
  File? imageFile;

  Future<void> _showOption(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Make a choice",
          style: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: ToolsUtilites.primarycolor,
          ),
        ),
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.image, color: ToolsUtilites.primarycolor),
                title: const Text(
                  "Gallery",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: ToolsUtilites.primarycolor,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context); // Close the dialog
                  _pickImageFromGallery();
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt_outlined, color: ToolsUtilites.primarycolor),
                title: const Text(
                  "Camera",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: ToolsUtilites.primarycolor,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context); // Close the dialog
                  _pickImageFromCamera();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickImageFromGallery() async {
    final returnImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      imageFile = File(returnImage.path);
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Result(imageFile: imageFile, result: {}, isLoading: true)),
    );
    await uploadImage();
  }

  Future<void> _pickImageFromCamera() async {
    final returnImage = await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      imageFile = File(returnImage.path);
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Result(imageFile: imageFile, result: {'disease': 'Unknown', 'description': 'An unidentified disease. We do not have any data to show you'}, isLoading: true)),
    );

    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Result(imageFile: imageFile, result: {'disease': 'Unknown', 'description': 'An unidentified disease. We do not have any data to show you'}, isLoading: false)),
    );
  }

  Future<void> uploadImage() async {
    if (imageFile == null) return;

    try {
      List<int> imageBytes = (await imageFile?.readAsBytes()) as List<int>;
      String base64Image = base64Encode(imageBytes);

      var response = await http.post(
        Uri.parse('https://6e35-20-200-120-107.ngrok-free.app/predict'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'image_data': base64Image}),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        if (data.containsKey('result')) {
          Map<String, dynamic> result = data['result'];
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Result(imageFile: imageFile, result: result, isLoading: false)),
          );
        }
      } else {
        _showErrorDialog('Failed to upload image. Status code: ${response.statusCode}');
      }
    } catch (e) {
      _showErrorDialog('An error occurred: $e');
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Error'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
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
          ],
        ),
      ],
    );
  }
}
