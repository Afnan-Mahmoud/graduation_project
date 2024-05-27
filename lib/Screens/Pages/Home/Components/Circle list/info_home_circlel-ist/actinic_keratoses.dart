import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../Provider/provider.dart';
import '../../../../Start Page/startpage.dart';



class Actinic_keratoses_H extends StatelessWidget {
  const Actinic_keratoses_H({super.key});

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
              icon: const Icon(Icons.keyboard_arrow_left)
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
                          'Actinic keratoses',
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
                                "lib/assets/images/Actinic.jpeg", fit: BoxFit.cover)
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
Actinic keratoses, also known as solar keratoses, are common skin lesions that develop as a result of prolonged exposure to ultraviolet (UV) radiation from the sun. These lesions are considered precancerous, as they have the potential to progress to squamous cell carcinoma, a type of skin cancer. Actinic keratoses are most commonly found on areas of the body that are frequently exposed to the sun, such as the face, ears, neck, scalp, forearms, and backs of the hands.

Symptoms:
Actinic keratoses typically present as rough, scaly, or crusty patches on the skin. They can vary in color, appearing as red, pink, flesh-colored, or brown. These lesions may be easier to feel than to see, and they can range in size from a few millimeters to a few centimeters. Actinic keratoses are often asymptomatic, but they can become tender, itchy, or inflamed.


Topical medications: Prescription creams or gels containing ingredients such as fluorouracil, imiquimod, ingenol mebutate, or diclofenac can be applied to the affected areas to help eliminate the abnormal cells.
Cryotherapy: The lesions are frozen with liquid nitrogen, causing them to slough off as the skin heals.
Photodynamic therapy: This involves applying a photosensitizing agent to the lesions and then exposing them to a specific type of light to destroy the abnormal cells.
Surgical removal: In some cases, particularly for thicker or more extensive lesions, surgical excision may be necessary.
Long-Term Management:
Actinic keratoses require ongoing management, as new lesions may appear over time, especially in individuals with a history of sun exposure. Regular skin examinations and self-checks for changes in existing lesions are important for early detection and prompt treatment. Additionally, practicing sun safety measures, such as wearing sunscreen, protective clothing, and seeking shade, can help prevent the development of new actinic keratoses.


Treatment of actinic keratoses, which are precancerous skin lesions caused by sun damage, aims to eliminate the abnormal cells and reduce the risk of progression to skin cancer. Treatment options for actinic keratoses may include:

1- Topical Medications: Prescription creams or gels containing ingredients such as fluorouracil, imiquimod, ingenol mebutate, or diclofenac can be applied to the affected areas to help eliminate the abnormal cells. These medications work by targeting and destroying the precancerous cells over a period of several weeks.

2- Cryotherapy: This procedure involves freezing the lesions with liquid nitrogen, causing them to slough off as the skin heals. Cryotherapy is a common and effective treatment for individual or widespread actinic keratoses.

3- Photodynamic Therapy: This treatment involves applying a photosensitizing agent to the lesions and then exposing them to a specific type of light to destroy the abnormal cells. Photodynamic therapy is particularly useful for widespread or difficult-to-treat actinic keratoses.

4- Chemical Peels: Chemical peels using trichloroacetic acid (TCA) or other agents can be used to remove the top layers of the skin, including the precancerous lesions.

5- Laser Therapy: Certain types of actinic keratoses, particularly those that are thick or widespread, can be treated with laser therapy. This method uses focused light to target and destroy the abnormal cells.

6- Surgical Removal: In some cases, particularly for thicker or more extensive lesions, surgical excision may be necessary. This may involve the complete removal of the lesions or debulking to reduce their size and impact.

It is important to note that the treatment approach for actinic keratoses is highly individualized and may involve a combination of these treatment modalities. Early detection and prompt treatment are crucial for reducing the risk of skin cancer associated with actinic keratoses. Additionally, ongoing monitoring and surveillance are essential to detect any potential recurrence or progression of the lesions.

It is recommended that individuals with actinic keratoses work closely with a healthcare professional, typically a dermatologist, to develop a comprehensive treatment plan tailored to their specific needs and circumstances. Regular skin examinations and self-checks for changes in existing lesions are important for early detection and prompt treatment.
''',
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ),
                  )
                ])));
  }
}
