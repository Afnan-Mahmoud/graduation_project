import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../Provider/provider.dart';
import '../../../../Start Page/startpage.dart';



class Basal_cell_H extends StatelessWidget {
  const Basal_cell_H({super.key});

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
          elevation: 0,
          backgroundColor: AppProvider.get(context).isDarkModeEnabled
              ?null:Colors.white,
            centerTitle: true,
            title:  Text("About Disease",
            style: TextStyle(
              color: AppProvider.get(context).isDarkModeEnabled
                  ?null:Colors.black
            )),
            leading: IconButton(
              onPressed: (){
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) =>  StartPage()),(route) => false,);
              },
              icon:  Icon(Icons.keyboard_arrow_left,color: AppProvider.get(context).isDarkModeEnabled
                  ?null:Colors.black,),
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
                          'Basal cell carcinoma',
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
                                "lib/assets/images/cell2.jpg",fit: BoxFit.cover)
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
Basal cell carcinoma (BCC) is the most prevalent form of skin cancer, accounting for about 80% of all diagnosed cases. It typically arises in the basal cells, which are found in the deepest layer of the epidermis, the outermost layer of the skin. BCC is often associated with long-term sun exposure and is more prevalent in fair-skinned individuals. While it is considered a slow-growing and locally invasive cancer, early detection and treatment are crucial for preventing potential complications.

Causes and Risk Factors:
The primary cause of basal cell carcinoma is exposure to ultraviolet (UV) radiation from the sun or tanning beds. Other risk factors include a history of frequent sunburns, a family history of skin cancer, a weakened immune system, and exposure to certain environmental toxins.

Symptoms:
Basal cell carcinoma often appears as a pearly or waxy bump, a flat, flesh-colored or brown scar-like lesion, or a bleeding or scabbing sore that does not heal. It can also manifest as a pink growth with slightly raised, rolled edges and an indentation in the center. BCC lesions can occur anywhere on the body, but they are most commonly found on areas frequently exposed to the sun, such as the face, ears, neck, scalp, shoulders, and back.

Surgical excision: The tumor is surgically removed, along with a margin of healthy tissue.
Mohs micrographic surgery: This precise surgical technique is often used for BCC on the face or other sensitive areas.
Cryotherapy: The lesion is frozen with liquid nitrogen, causing it to slough off.
Curettage and electrodesiccation: The tumor is scraped away and the base is cauterized.
Radiation therapy: This may be used for tumors that are difficult to treat with surgery.
Topical medications: Certain prescription creams or gels may be used for superficial BCCs.
Prognosis:
Basal cell carcinoma is generally associated with a high cure rate when detected and treated early. However, if left untreated, BCC can grow deeper into the skin and surrounding tissues, potentially causing disfigurement and damage to underlying structures. In rare cases, it can metast

Treatment of basal cell carcinoma (BCC), the most common form of skin cancer, depends on various factors, including the size, location, subtype, and stage of the cancer, as well as the individual's overall health. Treatment options for basal cell carcinoma may include:

1- Surgical Excision: The primary treatment for most BCCs involves surgical removal of the tumor and a margin of healthy tissue. This procedure, known as wide local excision, aims to completely remove the cancerous cells.

2- Mohs Micrographic Surgery: This precise surgical technique is often used for BCC on the face or other sensitive areas. It involves removing thin layers of tissue and examining them under a microscope immediately, allowing for the precise removal of cancerous cells while sparing healthy tissue.

3- Curettage and Electrodesiccation: This procedure involves scraping off the tumor with a curette (a sharp, spoon-shaped instrument) and then cauterizing the base to stop any bleeding and destroy residual abnormal cells.

4- Radiation Therapy: This treatment may be used for BCC in areas where surgical intervention is challenging, or for individuals who are not suitable candidates for surgery.

5- Cryotherapy: The tumor is frozen with liquid nitrogen, causing it to slough off as the skin heals. Cryotherapy is commonly used for superficial BCCs and for individuals who are not suitable candidates for surgery.

6- Topical Treatments: Certain prescription creams or gels containing ingredients such as fluorouracil, imiquimod, or ingenol mebutate may be used for superficial BCCs or for individuals who are not suitable candidates for other treatments.

7- Photodynamic Therapy: This involves applying a photosensitizing agent to the tumor and then exposing it to a specific type of light to destroy the abnormal cells.

It is important to note that the treatment approach for basal cell carcinoma is highly individualized and may involve a combination of these treatment modalities. Early detection and prompt treatment are crucial for improving the prognosis of individuals with BCC. Additionally, ongoing monitoring and surveillance are essential to detect any potential recurrence or progression of the cancer.

It is recommended that individuals with basal cell carcinoma work closely with a healthcare professional, typically a dermatologist or an oncologist, to develop a comprehensive treatment plan tailored to their specific needs and circumstances.


''',
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ),
                  )
                ])));
  }
}
