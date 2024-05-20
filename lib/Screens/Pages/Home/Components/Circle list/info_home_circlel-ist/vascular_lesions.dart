import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../Provider/provider.dart';
import '../../../../Start Page/startpage.dart';


class Vascular_lesions_H extends StatelessWidget {
  const Vascular_lesions_H({super.key});

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
                          'Vascular lesions',
                          textScaleFactor: 1.5,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0, bottom: 0.0),
                    child: Center(
                      child: SizedBox(
                        height: 230,
                        width: 400,
                        child: Column(
                          children: [
                            Image.asset(
                                "lib/assets/images/Vascular-Lesions.jpg", fit: BoxFit.cover)
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
Vascular lesions refer to abnormalities or malformations in the blood vessels, which can manifest in various parts of the body, including the skin. These lesions are broadly categorized into two main groups: vascular tumors and vascular malformations.

Vascular Tumors:
Vascular tumors are true proliferative neoplasms, meaning they involve abnormal cell growth in the blood vessels. They are further classified into benign, locally aggressive/borderline, and malignant categories. Examples of vascular tumors include hemangiomas and epithelioid hemangioendothelioma (EHE). Hemangiomas are common benign tumors that can occur in the skin or internal organs, while EHE is a rare malignant vascular tumor that can affect various parts of the body, including the head and neck area.

Vascular Malformations:
Vascular malformations, on the other hand, are defects in the morphogenesis of blood vessels and are not characterized by abnormal cell proliferation. They are further divided into several categories, including simple malformations (capillary, lymphatic, venous, arteriovenous malformations, and arteriovenous fistulas), combined malformations, malformations of major vessels, and those associated with other anomalies.

Examples of Vascular Lesions:

Capillary Malformations: These are cutaneous lesions that often present as "port wine stains" and are usually confined to the dermis. They are commonly diagnosed clinically and may be associated with conditions such as Sturge-Weber syndrome. Treatment options for capillary malformations may include laser therapy or surgical excision with reconstruction.

Venous Malformations: These are slow-flow lesions that can present as bluish-purple discolorations on the skin. They are often diagnosed based on imaging characteristics, and treatment may involve various approaches such as sclerotherapy or surgical intervention, depending on the size and location of the malformation.

Arteriovenous Malformations (AVMs): AVMs are abnormal tangles of blood vessels that can cause significant health issues, including skin discoloration, pain, and potential complications. Treatment for AVMs may involve embolization, surgical resection, or other interventional radiology procedures.

Understanding and Managing Vascular Lesions:
It is important to understand vascular lesions, particularly in the context of the head and neck, as they can have unique implications based on their location and potential involvement of major systems such as visual, digestive, and respiratory systems. Proper diagnosis and management

Treatment of vascular lesions, which include a range of conditions such as hemangiomas, port-wine stains, and venous malformations, depends on the specific type of lesion, its size, location, and the individual's overall health. Treatment options for vascular lesions may include:

1- Laser Therapy: Laser treatment, particularly pulsed dye laser (PDL) therapy, is commonly used for vascular lesions such as port-wine stains and hemangiomas. The laser targets the blood vessels in the lesion, causing them to shrink and fade over time.

2- Sclerotherapy: This procedure involves injecting a solution directly into the blood vessels of the lesion, causing them to shrink and eventually be reabsorbed by the body. Sclerotherapy is often used for venous malformations and certain types of vascular malformations.

3- Surgical Excision: In some cases, particularly for larger or deeper vascular lesions, surgical removal may be necessary. This may involve the complete excision of the lesion or debulking to reduce its size and impact.

4- Embolization: For certain types of vascular malformations, embolization may be performed to block the blood vessels supplying the lesion, reducing its size and symptoms.

5- Medications: In some cases, medications such as beta-blockers or corticosteroids may be used to help shrink certain types of vascular lesions, particularly hemangiomas.

6- Compression Therapy: Compression garments or bandages may be used to manage symptoms and reduce the size of certain types of vascular lesions.

It is important to note that the treatment approach for vascular lesions is highly individualized and may involve a combination of these treatment modalities. Early detection and prompt treatment are crucial for improving the prognosis of individuals with vascular lesions. Additionally, ongoing monitoring and surveillance are essential to detect any potential recurrence or progression of the lesions.

It is recommended that individuals with vascular lesions work closely with a multidisciplinary team of healthcare professionals, including dermatologists, vascular surgeons, and interventional radiologists, to develop a comprehensive treatment plan tailored to their specific needs and circumstances.
''',
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ),
                  )
                ])));
  }
}
