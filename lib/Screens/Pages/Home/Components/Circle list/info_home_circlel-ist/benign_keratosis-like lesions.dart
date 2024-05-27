import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../Provider/provider.dart';
import '../../../../Start Page/startpage.dart';


class Benign_keratosis_H extends StatelessWidget {
  const Benign_keratosis_H({super.key});

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
                          'Benign keratosis-like lesions',
                          textScaleFactor: 1.5,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0, bottom: 0.0),
                    child: Center(
                      child: SizedBox(
                        height: 300,
                        width: 400,
                        child: Column(
                          children: [
                            Image.asset(
                                "lib/assets/images/benign.png" ,fit: BoxFit.cover)
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
Benign keratosis-like lesions, also known as actinic keratoses, are areas of sun-damaged skin that are commonly found on sun-exposed parts of the body, such as the forearms, hands, face, ears, bald scalp, and lower legs. These lesions are caused by cumulative sun exposure over many years and are more prevalent in fair-skinned individuals who are prone to sunburn and have difficulty tanning.

Symptoms:
Actinic keratoses typically appear as skin-colored to pink lesions, some of which may be more easily felt than seen. They often feel rough to the touch and may develop a white surface scale. While they are generally flat, the rough white scale may thicken, and the lesions can grow up to 1-2 cm in diameter. Actinic keratoses are not usually painful.

Importance:
While most actinic keratoses are harmless, there is a small risk that they could progress into a form of skin cancer called squamous cell carcinoma. Individuals affected by actinic keratoses are at a higher risk of developing various types of skin cancer compared to those without these lesions. Additionally, individuals with numerous actinic keratoses and those with a weakened immune system are at the highest risk of developing skin cancer.

Long-Term Management:
Actinic keratoses require long-term management, as it is likely that more lesions will appear over time. Untreated actinic keratoses can lead to an increased risk of skin cancer, so it is important to monitor and address these lesions as necessary. Regular self-examinations and seeking medical advice for any changes in the lesions are crucial for long-term management.

In conclusion, while benign keratosis-like lesions (actinic keratoses) are generally harmless, they require attention and appropriate management to reduce the risk of progression to skin cancer. Individuals with these lesions should seek guidance from healthcare professionals for proper evaluation, treatment, and long-term monitoring.

Treatment Benign keratosis-like lesions, such as seborrheic keratosis and keratosis pilaris, are non-cancerous skin growths that often do not require treatment unless they cause discomfort or are cosmetically bothersome. However, if desired for cosmetic reasons or if the lesions are causing symptoms, several treatment options may be considered:

1- Cryotherapy: This involves freezing the lesions with liquid nitrogen, causing them to slough off as the skin heals. Cryotherapy is commonly used for seborrheic keratosis and can be effective for removing individual lesions.

2- Curettage and Electrodesiccation: This procedure involves scraping off the lesions with a curette (a sharp, spoon-shaped instrument) and then cauterizing the base to stop any bleeding and destroy residual abnormal cells. It is often used for seborrheic keratosis and other benign growths.

3- Laser Therapy: Certain types of benign keratosis-like lesions, particularly smaller and non-cancerous ones, can be treated with laser therapy. This method uses focused light to break down the pigment in the lesions, causing them to fade over time.

4- Topical Treatments: For certain types of benign keratosis-like lesions, such as keratosis pilaris, topical treatments containing ingredients like alpha hydroxy acids, urea, or retinoids may be used to help smooth the skin and reduce the appearance of the lesions.

5- Monitoring and Surveillance: In cases where the lesions are not causing any symptoms or concerns, a healthcare professional may recommend regular monitoring through skin examinations and self-checks. Any changes in the appearance or behavior of the lesions should be promptly evaluated.

It is important to note that self-removal of lesions, such as through cutting, scraping, or using over-the-counter treatments, is not recommended, as it can lead to complications, scarring, and potential infection. Additionally, it is crucial to seek medical advice if there are concerns about any changes in the appearance or behavior of benign keratosis-like lesions, as this could indicate a need for further evaluation and potential treatment.
''',
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ),
                  )
                ])));
  }
}
