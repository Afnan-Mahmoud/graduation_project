import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../Provider/provider.dart';
import '../Tips_Screen.dart';

class Skin_Routine extends StatelessWidget {
  static const String routeName="SkinRoutine";
  const Skin_Routine({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Skin routine',
      theme: ThemeData.light(), // Light theme
      darkTheme: ThemeData.dark(), // Dark theme
      themeMode: appProvider.isDarkModeEnabled
          ? ThemeMode.dark
          : ThemeMode.light, // Use themeMode to switch between light and dark mode
      home: const MyHomePage(title: 'Skin routine'),
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => Skin_Tips(),));
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
                          'Routine For Health Skin',
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
                        width: 700,
                        child: Column(
                          children: [
                            Image.asset(
                                "lib/assets/images/skin_care.png" ,fit: BoxFit.cover)
                          ],
                        ),
                      ),
                    ),
                  ),
                  // ignore: prefer_const_constructors
                  Padding(
    padding: const EdgeInsets.only(top: 0.0,left: 37,right: 10),
                    child: const Center(
                      child: Text(
                        '''
Cleansing:
Types of Cleansers:
Gel Cleansers: Ideal for oily and combination skin, they effectively remove excess oil and impurities without stripping the skin.
Cream Cleansers: Suitable for dry and sensitive skin, they provide hydration and gentle cleansing.
Foaming Cleansers: Good for oily and acne-prone skin, they help control sebum production and deep clean pores.
Double Cleansing: The practice of using an oil-based cleanser followed by a water-based cleanser to thoroughly remove makeup, sunscreen, and other impurities without disrupting the skin's natural balance.
2. Exfoliation:
Chemical Exfoliation: Utilizes alpha hydroxy acids (AHAs) like glycolic acid and lactic acid, and beta hydroxy acids (BHAs) like salicylic acid to dissolve dead skin cells, unclog pores, and promote cell turnover.
Physical Exfoliation: Involves using scrub particles, brushes, or facial cleansing devices to manually slough off dead skin cells and reveal smoother, brighter skin.
3. Toning:
Benefits: Helps remove any remaining impurities, balances the skin's pH, and preps the skin to better absorb subsequent skincare products.
Ingredients: Look for toners with hydrating and soothing ingredients like hyaluronic acid, rose water, aloe vera, and green tea.
4. Moisturizing:
Types of Moisturizers:
Emollients: Form a protective barrier on the skin's surface to lock in moisture and prevent water loss.
Humectants: Attract moisture from the environment and deeper layers of the skin to keep it hydrated.
Occlusives: Seal in moisture by forming a barrier over the skin, preventing transepidermal water loss (TEWL).
Night Creams: Typically richer and more nourishing than daytime moisturizers, they provide intense hydration and repair the skin while you sleep.
5. Sun Protection:
Importance: Shields the skin from harmful UV rays, preventing sunburn, premature aging, and skin cancer.
Broad-Spectrum Sunscreens: Protect against both UVA and UVB rays, with SPF (Sun Protection Factor) indicating the level of UVB protection.
Reapplication: Essential every 2 hours, especially during prolonged sun exposure, swimming, or sweating.
6. Targeted Treatments:
Serums: Concentrated formulations with active ingredients targeting specific skin concerns like hyperpigmentation, acne, fine lines, and dehydration.
Spot Treatments: Treat individual blemishes, acne spots, or areas of concern with specialized treatments containing ingredients like benzoyl peroxide, salicylic acid, or sulfur.
7. Skin Protection:
Antioxidants: Combat free radical damage and oxidative stress, protecting the skin from environmental aggressors like pollution and UV radiation.
Barrier Repair Products: Help strengthen the skin's natural barrier function and repair damage caused by external factors, enhancing resilience and preventing moisture loss.
8. Professional Treatments:
Dermatological Procedures: Include chemical peels, microdermabrasion, laser therapy, and microneedling, performed by skincare professionals to address specific concerns and improve skin texture, tone, and appearance.
By understanding these key components of skin care and tailoring your routine to your skin type, concerns, and lifestyle, you can achieve optimal skin health and a radiant complexion. Remember to be consistent, patient, and gentle with your skin, and consult a dermatologist for personalized advice and treatment recommendations when needed.

''',
                        style: TextStyle(fontSize: 13.0),
                      ),
                    ),
                  )
                ])));
  }
}