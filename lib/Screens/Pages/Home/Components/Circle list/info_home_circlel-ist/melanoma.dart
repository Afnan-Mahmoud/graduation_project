import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../Provider/provider.dart';
import '../../../../Start Page/startpage.dart';



class Melanoma_H extends StatelessWidget {
  const Melanoma_H({super.key});

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
                  const Column(
                    children: [
                      Padding(
                        padding:
                        EdgeInsets.only(top: 24.0, bottom: 15.0, left: 20),
                        child: Text(
                          'Melanoma',
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
                                "lib/assets/images/Melanoma2.jpg", fit: BoxFit.fitHeight)
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
Melanoma is a type of skin cancer that develops from the pigment-producing cells called melanocytes. These cells are responsible for producing melanin, the pigment that gives skin its color. Melanoma can occur anywhere on the skin, but it is most commonly found on the trunk in men and on the legs in women. It can also occur on the face and neck, as well as other areas of the body that are not typically exposed to the sun.

Causes:
The exact cause of melanoma is not fully understood, but it is believed to be influenced by a combination of genetic and environmental factors. Exposure to ultraviolet (UV) radiation from the sun or tanning beds is a significant risk factor for developing melanoma. Additionally, individuals with a family history of melanoma or those with a large number of moles are at a higher risk of developing this type of skin cancer.

Symptoms:
Melanoma often presents as a new mole or a change in an existing mole. The ABCDE rule is a helpful guide for identifying potential signs of melanoma:

Asymmetry: One half of the mole does not match the other half.
Border irregularity: The edges of the mole are irregular, ragged, notched, or blurred.
Color: The color of the mole is not uniform and may include shades of brown or black, with patches of red, white, or blue.
Diameter: The mole is larger than 6 millimeters in diameter (although melanomas can be smaller).
Evolution: The mole has changed in size, shape, color, or elevation, or it has started to itch, bleed, or become painful.
Potential Cures:
The treatment of melanoma depends on the stage of the cancer, which is determined by the thickness of the tumor, whether it has spread to nearby lymph nodes, and if it has metastasized to other parts of the body. Treatment options may include surgical excision, lymph node biopsy, immunotherapy, targeted therapy, radiation therapy, and chemotherapy. Early detection and treatment are crucial for improving the prognosis of individuals with melanoma.

Prevention:
Preventive measures for melanoma include practicing sun safety, such as wearing sunscreen, protective clothing, and seeking shade during peak sun hours. Regular skin examinations and self-checks for changes in moles are also important for early detection and prompt treatment.

In conclusion, melanoma is a serious form of skin cancer that requires prompt medical attention. Understanding the risk factors, symptoms, and preventive measures can help individuals reduce their

Treatment of melanoma, a type of skin cancer, depends on various factors, including the stage of the cancer, the depth of the tumor, whether it has spread to nearby lymph nodes, and if it has metastasized to other parts of the body. Treatment options for melanoma may include:

1- Surgical Excision: The primary treatment for early-stage melanoma involves surgical removal of the tumor and a margin of healthy tissue. This procedure is known as wide local excision and aims to completely remove the cancerous cells.

2- Lymph Node Biopsy: If there is concern about the spread of melanoma to nearby lymph nodes, a sentinel lymph node biopsy may be performed to determine if the cancer has metastasized. This can help guide further treatment decisions.

3- Immunotherapy: Immunotherapy drugs, such as checkpoint inhibitors (e.g., pembrolizumab, nivolumab) and interleukin-2 (IL-2), work by boosting the body's immune response to target and destroy cancer cells.

4- Targeted Therapy: Targeted therapy drugs, such as BRAF inhibitors (e.g., vemurafenib, dabrafenib) and MEK inhibitors (e.g., trametinib), are used for melanomas with specific genetic mutations, such as the BRAF mutation.

5- Radiation Therapy: This treatment may be used to target and destroy cancer cells, particularly in cases where the melanoma has spread to other parts of the body.

6- Chemotherapy: While less commonly used for melanoma, chemotherapy may be considered in certain cases, particularly for advanced or metastatic melanoma.

7- Clinical Trials: Participation in clinical trials may offer access to innovative treatments and therapies that are being investigated for their effectiveness in treating melanoma.

It is important to note that the treatment approach for melanoma is highly individualized and may involve a combination of these treatment modalities. Early detection and prompt treatment are crucial for improving the prognosis of individuals with melanoma. Additionally, ongoing monitoring and surveillance are essential to detect any potential recurrence or spread of the cancer.

It is recommended that individuals with melanoma work closely with a multidisciplinary team of healthcare professionals, including dermatologists, oncologists, and surgeons, to develop a comprehensive treatment plan tailored to their specific needs and circumstances.


''',
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ),
                  )
                ])));
  }
}