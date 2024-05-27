import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../Provider/provider.dart';
import '../../../../Start Page/startpage.dart';


class Melanocytic_nevi_H extends StatelessWidget {
  const Melanocytic_nevi_H({super.key});

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
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) =>  StartPage()),(route) => false,);
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
                   Column(
                    children: const [
                      Padding(
                        padding:
                        EdgeInsets.only(top: 24.0, bottom: 15.0, left: 20),
                        child: Text(
                          'Melanocytic nevi',
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
                                "lib/assets/images/melanocytic3.png",fit: BoxFit.cover)
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
Melanocytic nevi, commonly known as moles, are benign skin growths that develop when pigment-producing cells called melanocytes cluster together. These nevi can appear at birth or develop later in life, and they can vary in color, size, and shape. While most melanocytic nevi are harmless, some may develop into melanoma, a type of skin cancer.

Causes:
The exact cause of melanocytic nevi is not fully understood, but they are believed to be influenced by genetic factors and sun exposure. Individuals with a family history of melanocytic nevi or those with fair skin are more likely to develop these skin growths.

Symptoms:
Melanocytic nevi can manifest as small, dark spots on the skin, and they may be flat or raised. They can range in color from tan to brown to black, and their texture may be smooth or slightly bumpy. While most melanocytic nevi are benign, changes in size, shape, or color should be monitored as they could indicate the development of melanoma.

Potential Cures:
The treatment of melanocytic nevi depends on various factors, including their size, location, and the individual's medical history. In many cases, no treatment is necessary, especially for small, non-threatening nevi. However, if a melanocytic nevus shows signs of potential malignancy, such as asymmetry, irregular borders, or changes in color, a dermatologist may recommend a biopsy or surgical removal.

Prevention:
To reduce the risk of developing melanocytic nevi and potential skin cancer, it is important to practice sun safety measures, including wearing sunscreen, protective clothing, and seeking shade during peak sun hours. Regular skin examinations and self-checks for changes in existing nevi are also crucial for early detection and treatment.

In conclusion, while melanocytic nevi are generally harmless, it is essential to monitor them for any changes and seek medical attention if there are concerns about their appearance or behavior. Early detection and proper management can help prevent the progression of melanocytic nevi to melanoma, ultimately improving the prognosis for individuals with these skin growths.

Treatment of melanocytic nevi, commonly known as moles, depends on various factors, including the characteristics of the nevi, the individual's medical history, and any concerns about potential malignancy. In most cases, melanocytic nevi are harmless and do not require treatment. However, if there are concerns about the appearance or behavior of a nevus, or if it poses a risk of irritation due to its location, several treatment options may be considered:

1- Surgical Excision: This involves the complete removal of the mole, along with a margin of healthy skin, under local anesthesia. Surgical excision is often recommended for atypical or dysplastic nevi, which may exhibit irregular features that raise concerns about potential malignancy.

2- Laser Removal: Certain types of moles, particularly smaller and non-cancerous ones, can be treated with laser therapy. This method uses focused light to break down the pigment in the mole, causing it to fade over time.

3- Shave Excision: For raised moles that are non-cancerous, a shave excision may be performed. This involves using a surgical blade to shave off the mole at skin level, resulting in minimal scarring.

4- Monitoring and Surveillance: In cases where the mole is not causing any symptoms or concerns, a healthcare professional may recommend regular monitoring through skin examinations and self-checks. Any changes in the mole's appearance, such as growth, changes in color, or irregular borders, should be promptly evaluated.

It is important to note that self-removal of moles, such as through cutting, scraping, or using over-the-counter treatments, is not recommended, as it can lead to complications, scarring, and potential infection. Additionally, it is crucial to seek medical advice if there are concerns about any changes in the appearance or behavior of a mole, as this could indicate a need for further evaluation and potential treatment.

In conclusion, the treatment of melanocytic nevi depends on the specific characteristics of the mole and should be guided by a healthcare professional's assessment. It is important to prioritize proper evaluation and management to ensure the best possible outcome for individuals with concerns about their moles.
''',
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ),
                  )
                ])));
  }
}
