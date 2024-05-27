import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/Screens/Pages/Chatbot/chat.dart';
import 'package:graduation_project/Screens/Pages/Start%20Page/start_page_cubit.dart';
import 'dart:io';
import '../Start Page/startpage.dart';

class Result extends StatefulWidget {
  static const String routeName="Result";
  final Map<String, dynamic> result;
  final File? imageFile;
  final bool isLoading;

  const Result({super.key, required this.result, this.imageFile, this.isLoading = true});

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Result',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.transparent),
        useMaterial3: true,
      ),
      home: MyHomePage(
        title: 'Result',
        result: widget.result,
        imageFile: widget.imageFile,
        isLoading: widget.isLoading,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
    required this.result,
    this.imageFile,
    this.isLoading = true,
  });

  final String title;
  final Map<String, dynamic> result;
  final File? imageFile;
  final bool isLoading;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late bool loading;
  late Map<String, dynamic> resultData;

  @override
  void initState() {
    super.initState();
    loading = widget.isLoading;
    resultData = widget.result;
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
            bottom: Radius.circular(30),
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
            padding: const EdgeInsets.only(top: 40.0, bottom: 9.0, left: 10),
            child: Center(
              child: Text(
                ' ${widget.result['disease'] == 'Unknown' ? 'Unknown disease' : 'You have an ${widget.result['disease']}'}',
                textScaleFactor: 1.5,
              ),
            ),
          ),
            if (widget.imageFile != null)
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Image.file(widget.imageFile!),
              ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0, bottom: 9.0, left: 15,right: 5),
              child: Center(
                child: Text(
                 '${widget.result['description']}',
                  textScaleFactor: 1.1,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 9.0),
              child: Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder:(context) {
                        return BlocProvider(create: (context) => StartPageCubit(),
                        child: BlocBuilder<StartPageCubit,StartPageState>(builder: (context, state) => ChatPage(),),
                        );
                      },),
                    );
                  },
                  child: Text(
                    'Know more...',
                    style: TextStyle(
                      color: Color(0xff427d9d), // Text color
                      fontSize: 15, // Text size
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0x96c5c1c1)), // Button background color
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
