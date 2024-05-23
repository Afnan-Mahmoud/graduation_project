import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import '../Start Page/startpage.dart';

class Result extends StatefulWidget {
  final String responseData;
  final File? imageFile;

  const Result({Key? key, required this.responseData, required this.imageFile}) : super(key: key);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  late bool loading;
  late String resultData;

  @override
  void initState() {
    super.initState();
    loading = true;
    resultData = widget.responseData; // عرض البيانات المبدئية إذا كانت موجودة
    if (resultData.isEmpty) {
      fetchDataFromServer();
    } else {
      loading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Result"),
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const StartPage()),
            );
          },
          icon: const Icon(Icons.keyboard_arrow_left),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: loading
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0, bottom: 9.0),
              child: Center(
                child: Text(
                  resultData.isNotEmpty ? resultData : 'No Data Available',
                  textScaleFactor: 1.5,
                ),
              ),
            ),
            if (widget.imageFile != null)
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Image.file(widget.imageFile!),
              ),
          ],
        ),
      ),
    );
  }

  void fetchDataFromServer() async {
    try {
      final response = await http.get(Uri.parse('https://postman-echo.com/get?foo1=bar1&foo2=bar2'));
      if (response.statusCode == 200) {
        setState(() {
          resultData = response.body;
          loading = false;
        });
      } else {
        // Handle error response
        print('Failed connection with status code: ${response.statusCode}');
        setState(() {
          loading = false;
        });
      }
    } catch (e) {
      // Handle connection error
      print('Failed connection with error: $e');
      setState(() {
        loading = false;
      });
    }
  }
}
