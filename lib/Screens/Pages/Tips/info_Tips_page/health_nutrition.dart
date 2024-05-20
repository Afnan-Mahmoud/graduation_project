import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../Provider/provider.dart';
import '../Tips_Screen.dart';



class Health_Nutrition extends StatelessWidget {
  const Health_Nutrition({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Health nutrition',
      theme: ThemeData.light(), // Light theme
      darkTheme: ThemeData.dark(), // Dark theme
      themeMode: appProvider.isDarkModeEnabled
          ? ThemeMode.dark
          : ThemeMode.light, // Use themeMode to switch between light and dark mode
      home:  const MyHomePage(title: 'Health nutrition'),
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
            title: const Text("Tips"),
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
                          'Health nutrition For Skin',
                          textScaleFactor: 1.5,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0, bottom: 0.0),
                    child: Center(
                      child: SizedBox(
                        height: 240,
                        width: 400,
                        child: Column(
                          children: [
                            Image.asset(
                                "lib/assets/images/Eat_health.png", fit: BoxFit.cover)
                          ],
                        ),
                      ),
                    ),
                  ),
                  // ignore: prefer_const_constructors
                  Padding(
                    padding: const EdgeInsets.only(top: 0.0,left: 37,right: 10),
                    child: const Center(
                      child: Text('''
Your health food effect on your skin,so you should take care from your food system "Diet"...                       
Eat Plenty of Fruits and Vegetables:
Incorporate a variety of colorful fruits and vegetables into your diet to provide essential vitamins, minerals, and antioxidants for skin health.
Include Omega-3 Fatty Acids:
Consume foods rich in omega-3 fatty acids, such as fatty fish (salmon, mackerel), flaxseeds, chia seeds, and walnuts, to support skin elasticity and hydration.
Choose Healthy Fats:
Opt for sources of healthy fats like avocados, nuts, seeds, and olive oil to nourish your skin from the inside out.
Limit Processed Foods and Added Sugars:
Minimize your intake of processed foods, sugary snacks, and beverages, as they can contribute to skin inflammation and acne.
Focus on Nutrient-Dense Foods:
Prioritize nutrient-dense foods like lean proteins, whole grains, and legumes to provide the building blocks for healthy skin cells.
Consume Skin-Friendly Nutrients:
Include foods rich in skin-friendly nutrients such as vitamin C (citrus fruits, strawberries), vitamin E (almonds, spinach), and vitamin A (sweet potatoes, carrots) to support skin repair and renewal.
Moderate Alcohol and Caffeine Intake:
Limit alcohol and caffeine consumption, as they can dehydrate the skin and contribute to inflammation.
Stay Consistent with Healthy Eating Habits:
Make healthy eating a habit by choosing nutrient-rich foods consistently to support long-term skin health.
Stay Hydrated:
Drink plenty of water throughout the day to keep your skin hydrated and healthy.
Consult a Healthcare Professional:
If you have specific skin concerns or conditions, consult with a dermatologist or registered dietitian for personalized dietary recommendations tailored to your needs.

''',
                        style: TextStyle(fontSize: 13.0),
                      ),
                    ),
                  )
                ])));
  }
}
