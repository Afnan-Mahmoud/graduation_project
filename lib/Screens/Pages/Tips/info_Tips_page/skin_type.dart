import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../Provider/provider.dart';
import '../Tips_Screen.dart';

class Skin_Type extends StatelessWidget {
  static const String routeName="SkinType";
  const Skin_Type({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Skin Type',
      theme: ThemeData.light(), // Light theme
      darkTheme: ThemeData.dark(), // Dark theme
      themeMode: appProvider.isDarkModeEnabled
          ? ThemeMode.dark
          : ThemeMode.light, // Use themeMode to switch between light and dark mode
      home: const MyHomePage(title: 'Skin Type'),
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
            title:  Text("Tips",
            style: TextStyle(
              color: AppProvider.get(context).isDarkModeEnabled
                  ?null:Colors.black
            ),
            ),
            leading: IconButton(
              onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) => Skin_Tips(),));
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
                          'Know Your Skin Type',
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
                          "lib/assets/images/Skin_Type.jpg", fit: BoxFit.fitHeight,)
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
Knowing your skin type is essential for selecting the right skincare products and developing an effective skincare routine tailored to your specific needs. Here are the common skin types and their characteristics:

1- Normal Skin:
Characteristics: Balanced, neither too oily nor too dry.
Appearance: Few to no imperfections, minimal pores, and a radiant complexion.
Texture: Smooth and even.
Maintenance: Requires minimal maintenance, but still benefits from a basic skincare routine.
2- Dry Skin:
Characteristics: Lacks moisture and natural oils, feels tight or rough.
Appearance: Dull, flaky, and prone to fine lines and wrinkles.
Texture: Rough or uneven.
Maintenance: Requires hydrating products rich in moisturizing ingredients like hyaluronic acid, glycerin, and shea butter. Avoid harsh cleansers and hot water, and use gentle, nourishing products to replenish moisture.
3- Oily Skin:
Characteristics: Excess sebum production, shiny or greasy appearance.
Appearance: Enlarged pores, prone to acne, blackheads, and blemishes.
Texture: Thick or coarse.
Maintenance: Requires oil-controlling and mattifying products, such as gel-based cleansers, oil-free moisturizers, and non-comedogenic sunscreen. Regular exfoliation can help unclog pores and prevent breakouts.
4- Combination Skin:
Characteristics: Combination of oily and dry areas on different parts of the face.
Appearance: Oily T-zone (forehead, nose, and chin) and dry cheeks.
Texture: Variable, with both dry patches and enlarged pores.
Maintenance: Use gentle, balancing products that address both oily and dry areas. Consider using different products for different zones of the face, such as a lightweight gel moisturizer for the T-zone and a richer cream for the cheeks.
5- Sensitive Skin:
Characteristics: Easily irritated, reacts to certain skincare products or environmental factors.
Appearance: Redness, itching, burning, or stinging sensations.
Texture: Fragile or delicate.
Maintenance: Use hypoallergenic, fragrance-free, and gentle skincare products specifically formulated for sensitive skin. Avoid harsh ingredients like alcohol, fragrances, and synthetic dyes. Patch test new products before applying them to your entire face.
6- Acne-Prone Skin:
Characteristics: Prone to frequent breakouts, blackheads, whiteheads, and inflammation.
Appearance: Pimples, cysts, and nodules, especially in the T-zone.
Texture: Oily or congested.
Maintenance: Use non-comedogenic, oil-free products that help control excess oil production and prevent clogged pores. Incorporate acne-fighting ingredients like salicylic acid, benzoyl peroxide, or retinoids into your skincare routine.
To determine your skin type, observe how your skin feels and looks throughout the day, especially after cleansing. You can also consult a dermatologist or skincare professional for a professional assessment. Once you know your skin type, you can select the appropriate skincare products and treatments to address your specific concerns and achieve healthy, radiant skin.


To Know Your Skin Type :
Wash Your Face: Start by washing your face with a gentle cleanser to remove any dirt, oil, or makeup. Pat your skin dry with a clean towel.
Wait for One Hour: Allow your skin to rest for about an hour without applying any skincare products. This allows your skin to return to its natural state and helps in accurate assessment.
Observe Your Skin: After the hour has passed, observe how your skin looks and feels. Pay attention to the following characteristics:
Dry Skin: If your skin feels tight, rough, or flaky, especially on the cheeks, forehead, and jawline, you likely have dry skin. Dry skin may also have fine lines and a dull complexion.
Oily Skin: If your skin looks shiny or greasy, especially in the T-zone (forehead, nose, and chin), and you notice enlarged pores, you likely have oily skin. Oily skin may also be prone to acne and blackheads.
Combination Skin: If you have a mix of dry and oily areas on your face, with an oily T-zone and drier cheeks, you likely have combination skin. Combination skin may require different skincare routines for different areas of the face.
Normal Skin: If your skin feels balanced, neither too oily nor too dry, with small pores and a smooth texture, you likely have normal skin. Normal skin is generally well-balanced and not prone to extreme dryness or oiliness.
Sensitive Skin: If your skin is prone to redness, itching, burning, or irritation when exposed to certain skincare products, environmental factors, or harsh ingredients, you likely have sensitive skin. Sensitive skin may react negatively to certain products or environmental triggers.
Consider Other Factors: Take into account other factors that may affect your skin type, such as age, hormonal changes, seasonal variations, and lifestyle habits.
Consult a Dermatologist: If you're unsure about your skin type or have specific concerns about your skin health, consider consulting a dermatologist for a professional assessment and personalized recommendations.

''',
                        style: TextStyle(fontSize: 13.0),
                      ),
                    ),
                  )
                ])));
  }
}
