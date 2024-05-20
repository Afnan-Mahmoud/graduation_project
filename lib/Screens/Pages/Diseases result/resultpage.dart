import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Start Page/startpage.dart';


class Result extends StatelessWidget {
  final String apiUrl = "https://bd4f-102-190-222-83.ngrok-free.app/predict";

  const Result({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Result ',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.transparent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Result'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  @override

  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text("Result"),
            leading: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const StartPage()));
              },
              icon: const Icon(Icons.keyboard_arrow_left),
            ),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ))),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 40.0, bottom: 9.0),
                    child: Center(
                      child: Text(
                        'You have an Eczema',
                        textScaleFactor: 1.5,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 9, bottom: 20.0),
                child: Center(
                  child: SizedBox(
                    height: 300,
                    width: 400,
                    child: Column(children: [
                      Image.network(
                          'https://s3-alpha-sig.figma.com/img/b2be/57b5/58cb4eb9ccb748d8b758839299fe60bd?Expires=1715558400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=W724vExwcMuE1Mcb1r5o8IPtr1A7Tf0zNA1RpqfiXjnUoF2G95K9doszMD39VL972ZVRxlAIijZmAEltkSjV-rvkVG0YazCFcSI-Hv~g-beFMhkowmxmKztr6UVBxLut-c3IumyY66-PtW-ClmBwCRDqq~JPk0AkqlYM6MmyP~-ThPm79fm2qDdPsJc-0n2GkVaNVd5y6aZMwDygjlYVFegMwEkd~6ivutLK3vpKUZX0qvE2Gspbhx4UevlhUS578DcYpdJUxF59XFviu8vlH4bI5VAplMAt9tkRxay8flQsWPcjfK75tLQrMVhWhN4s1heLFq-FJz2ZGuN5q82U4A__'
                          ,fit: BoxFit.cover)
                    ]),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 8),
                child: Column(children: [
                  const SizedBox(height: 30),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: <Color>[
                                  Color(0xffc6c9cb),
                                  Color(0xffc6c9cb),
                                  Color(0xffc6c9cb),
                                ],
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.black45,
                            padding: const EdgeInsets.all(16.0),
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          onPressed: () {

                          },
                          child: const Text('About Diseases'),
                        ),
                      ],
                    ),
                  )
                ]),
              )
            ])
    );
  }
}
void fetchDataFromServer() async {
  try {
    final response = await http.get(Uri.parse('https://bd4f-102-190-222-83.ngrok-free.app/predict'));
    if (response.statusCode == 200) {
      // Handle successful response
    } else {
      // Handle error response
    }
  } catch (e) {
    // Handle connection error
  }
}