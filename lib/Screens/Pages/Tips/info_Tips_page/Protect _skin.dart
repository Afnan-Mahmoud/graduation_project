import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Provider/provider.dart';
import '../Tips_Screen.dart';


class Protect_Skin extends StatelessWidget {
  const Protect_Skin({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Protect Skin',
      theme: ThemeData.light(), // Light theme
      darkTheme: ThemeData.dark(), // Dark theme
      themeMode: appProvider.isDarkModeEnabled
          ? ThemeMode.dark
          : ThemeMode.light, // Use themeMode to switch between light and dark mode
      home: const MyHomePage(title: 'Protect Skin'),
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
            title: const Text("Tips "),
            leading: IconButton(
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Skin_Tips()));
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
                          'Protect measures for your skin',
                          textScaleFactor: 1.5,

                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0, bottom: 0.0),
                    child: Center(
                      child: SizedBox(
                        height: 200,
                        width: 400,
                        child: Column(
                          children: [
                            Image.asset(
                                "lib/assets/images/protect-your-skin.png", fit: BoxFit.cover)
                          ],
                        ),
                      ),
                    ),
                  ),
                  // ignore: prefer_const_constructors
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0,left: 37,right: 10),
                    child: const Center(
                      child: Text(
                        '''
Protective measures for your skin are essential to maintain its health and prevent damage from environmental factors. Here are some key protective measures you can take:

Sun Protection:
Apply sunscreen with broad-spectrum protection (UVA and UVB) every day, even on cloudy days. Choose a sunscreen with SPF 30 or higher and reapply it every two hours, especially if you're outdoors or swimming.
Wear protective clothing, such as wide-brimmed hats, sunglasses, and long-sleeved shirts, to shield your skin from the sun's harmful UV rays.
Seek shade during peak sun hours (10 a.m. to 4 p.m.) when the sun's rays are the strongest.
Hydration:
Drink plenty of water throughout the day to keep your skin hydrated from the inside out. Aim for at least eight glasses of water daily, or more if you're physically active or live in a dry climate.
Moisturize:
Use a moisturizer appropriate for your skin type to maintain its hydration levels and strengthen the skin's natural barrier. Apply moisturizer daily, especially after showering or bathing, to lock in moisture.
Avoid Smoking:
Smoking can accelerate skin aging, lead to wrinkles, and contribute to dull, sallow-looking skin. Quitting smoking or avoiding exposure to secondhand smoke can help protect your skin's health and appearance.
Healthy Diet:
Eat a balanced diet rich in fruits, vegetables, whole grains, and lean proteins to provide essential nutrients that support skin health. Foods high in antioxidants, vitamins, and minerals can help protect the skin from damage caused by free radicals.
Gentle Skincare Products:
Choose skincare products formulated with gentle, non-irritating ingredients that are suitable for your skin type. Avoid harsh cleansers, exfoliants, and skincare treatments that can strip the skin of its natural oils and cause irritation.
Manage Stress:
Chronic stress can trigger inflammation in the body and exacerbate skin conditions like acne, eczema, and psoriasis. Practice stress-reduction techniques such as mindfulness meditation, deep breathing exercises, yoga, or tai chi to promote skin health and overall well-being.
Avoid Hot Water:
Washing your face or showering with hot water can strip the skin of its natural oils and lead to dryness and irritation. Use lukewarm water instead and limit the duration of your showers to prevent moisture loss from the skin.
Regular Skin Checks:
Perform regular self-examinations of your skin to monitor for any changes, such as new moles, growths, or suspicious lesions. If you notice any abnormalities or signs of skin cancer, consult a dermatologist promptly for evaluation and treatment.

''',
                        style: TextStyle(fontSize: 13.0),
                      ),
                    ),
                  )
                ])));
  }
}
