import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../Provider/provider.dart';
import '../../../../Start Page/startpage.dart';


class Dermatofibroma_H extends StatelessWidget {
  const Dermatofibroma_H({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseases',
      theme: ThemeData.light(), // Light theme
      darkTheme: ThemeData.dark(), // Dark theme
      themeMode: appProvider.isDarkModeEnabled
          ? ThemeMode.dark
          : ThemeMode.light, // Use themeMode to switch between light and dark mode
      home: const MyHomePage(title: 'Diseases'),
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
            title: const Text("About Disease"),
            leading: IconButton(
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const StartPage()));
              },
              icon: const Icon(Icons.keyboard_arrow_left,),
            ),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ))),
        body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Column(
                    children: [
                      Padding(
                        padding:
                        EdgeInsets.only(top: 24.0, bottom: 15.0, left: 20),
                        child: Text(
                          'Dermatofibroma',
                          textScaleFactor: 1.5,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0, bottom: 0.0),
                    child: Center(
                      child: SizedBox(
                        height: 275,
                        width: 400,
                        child: Column(
                          children: [
                            Image.asset(
                                "lib/assets/images/Dermatofibroma.png" ,fit: BoxFit.cover)
                          ],
                        ),
                      ),
                    ),
                  ),
                  // ignore: prefer_const_constructors
                  Padding(
                    padding: const EdgeInsets.only(top: 0.0,left: 37,right: 15),
                    child: const Center(
                      child: Text(
                        '''
Dermatofibroma, also known as benign fibrous histiocytoma, is a common benign skin lesion that typically arises in the dermis, the deeper layer of the skin. These growths are often found on the legs but can occur anywhere on the body. Dermatofibromas are usually harmless and are thought to develop in response to minor trauma or injury to the skin, such as insect bites, shaving nicks, or thorn pricks.

Symptoms:
Dermatofibromas typically present as small, firm, raised bumps that feel like hard nodules or rubbery buttons beneath the skin's surface. They are usually less than 1 cm in diameter and may vary in color, ranging from pink to brown. While they are generally painless, some individuals may experience tenderness, itching, or pain upon touching or applying pressure to the lesion. In some cases, dermatofibromas may exhibit a dimple or central depression when pinched from the sides, a characteristic known as the dimple sign.

In most instances, dermatofibromas do not require treatment, as they are benign and tend to remain stable over time. However, if desired for cosmetic reasons or if the lesion causes discomfort, treatment options may include:

Intra-lesional steroid injections: These injections can help reduce the size and firmness of the dermatofibroma.
Cryotherapy: Freezing the lesion with liquid nitrogen may be used to diminish the appearance of the dermatofibroma.
Surgical removal: If the dermatofibroma is bothersome or causing symptoms, it can be surgically excised under local anesthesia.
Prognosis:
Dermatofibromas are generally considered harmless and do not pose a significant health risk. They are not cancerous and are not known to develop into skin cancer. While some dermatofibromas may spontaneously regress, others may persist indefinitely without causing any significant issues.

In conclusion, dermatofibromas are common benign skin lesions that typically do not require treatment unless they cause discomfort or are cosmetically bothersome. It is important to consult a healthcare professional


Treatment of dermatofibromas, which are benign skin growths, is typically focused on addressing any symptoms or concerns related to the lesions. While dermatofibromas are generally harmless and often do not require treatment, several options may be considered for individuals who experience discomfort or desire the removal of the lesions for cosmetic reasons. Treatment options for dermatofibromas may include:

1- Surgical Excision: The primary treatment for dermatofibromas involves surgical removal of the lesion under local anesthesia. This procedure aims to completely remove the growth, along with a margin of surrounding normal skin, to reduce the chance of local recurrence.

2- Intra-lesional Steroid Injections: Dermatofibromas can improve slightly, becoming flatter, with the use of steroid injections directly into the lesion. This treatment may be considered for individuals who prefer a non-surgical approach.

3- Cryotherapy: Freezing the dermatofibromas with liquid nitrogen can be used, although this may leave a scar, and the lesion may recur. Cryotherapy is typically considered for smaller lesions.

4- Laser Therapy: Some types of lasers, including carbon dioxide lasers and pulsed dye lasers, have shown good results in flattening dermatofibromas or targeting the blood supply to the lesion. However, it is important to note that these treatments may also result in scarring.

5- Observation and Reassurance: In many cases, dermatofibromas are harmless and cause little trouble. Therefore, no treatment may be necessary apart from an accurate diagnosis and reassurance.

It is important to note that the treatment approach for dermatofibromas is highly individualized and may depend on the size, location, and individual preferences. It is recommended that individuals with dermatofibromas consult with a healthcare professional, typically a dermatologist, to discuss the available treatment options and develop a plan tailored to their specific needs and circumstances.

Additionally, individuals should seek medical advice if they have concerns about any changes in the appearance or behavior of dermatofibromas, as this could indicate a need for further evaluation and potential treatment. Regular skin examinations and self-checks for changes in existing lesions are important for early detection and prompt treatment.
''',
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ),
                  )
                ])));
  }
}
