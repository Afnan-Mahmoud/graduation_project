import 'package:flutter/material.dart';

class Ai_tracking extends StatelessWidget {
  const Ai_tracking({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ai tracking ',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.transparent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Ai tracking'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text("Ai tracking"),
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.keyboard_arrow_left),
            ),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ))),
        body: Padding(
          padding: const EdgeInsets.only(top: 9, bottom: 20.0),
          child: Center(
            child: SizedBox(
              height: 167,
              width: 167,
              child: Column(children: [
                Image.network(
                'https://s3-alpha-sig.figma.com/img/fe29/a529/f2830f04b91a3f263bda389b05fa7d15?Expires=1716163200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=VHN3IA0GBWpvbtN36Rl2l1rlBlNiQQHg9wzEgBuOPHfus2cQ7Fx4W8jPTcqoy7btnJq3vkDBC3hL2bEIMxWodEJb5hf87NpctwQHXsiHH04fOz~pwVYr7aY0z~IC0a8MqOXtUuAQfI1XCxyEWVUujJNumcCDJn5TpdtxYAd4V1qULMcSK6BswvrCMMO6og64LQA5UeNFCoImYbqU5RnLqffELh1LZ3P67tACmuciavHD2sSOQ6y6Go6yn5zxYvlmGVWuaScEibpW6OMa6LF3si84BUg2dvQjQppDCrcCeltYUpC~AzdG02ejB7Z7u2sX34Bdj-nBfl9bOfdUESOHnQ__'
                ,fit: BoxFit.cover)
              ]),
            ),
          ),
        ));
  }
}