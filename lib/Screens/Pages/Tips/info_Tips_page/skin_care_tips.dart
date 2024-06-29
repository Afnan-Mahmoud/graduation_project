import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Provider/provider.dart';
import '../Tips_Screen.dart';



class Skin_Care_Tips extends StatelessWidget {
  static const String routeName="SkinCareTips";
  const Skin_Care_Tips({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Skin Care Tips',
      theme: ThemeData.light(), // Light theme
      darkTheme: ThemeData.dark(), // Dark theme
      themeMode: appProvider.isDarkModeEnabled
          ? ThemeMode.dark
          : ThemeMode.light, // Use themeMode to switch between light and dark mode
      home: const MyHomePage(title: 'Skin Care Tips'),
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
            title:  Text("Tips",style: TextStyle(
              color: AppProvider.get(context).isDarkModeEnabled
                  ?null:Colors.black
            )),
            leading: IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Skin_Tips(),));
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
                          'Skin Care Tips',
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
                                "lib/assets/images/Skincare-Tips.jpg", fit: BoxFit.cover)
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
Stay Hydrated: Water is essential for maintaining optimal skin health. It helps to flush out toxins, regulate body temperature, and keep skin cells hydrated. Aim to drink at least 8 glasses of water per day, and increase your intake if you're exercising or in hot weather.
Follow a Consistent Skincare Routine: A daily skincare routine is essential for maintaining healthy skin. Cleanse your skin twice daily to remove dirt, oil, and impurities. Use a gentle cleanser that won't strip away natural oils. Follow up with a toner to balance the skin's pH levels, and then apply a moisturizer to keep your skin hydrated. Finally, don't forget to apply sunscreen with SPF 30 or higher every morning to protect your skin from UV damage.
Protect Your Skin from the Sun: Sun exposure is one of the leading causes of premature aging and skin damage. Apply a broad-spectrum sunscreen with SPF 30 or higher every day, even on cloudy days or during the winter months. Reapply sunscreen every 2 hours, especially if you're swimming or sweating.
Eat a Healthy Diet: Your diet plays a significant role in the health of your skin. Focus on eating a balanced diet rich in fruits, vegetables, whole grains, lean proteins, and healthy fats. These foods provide essential nutrients like vitamins, minerals, and antioxidants that promote skin health and combat inflammation.
Get Adequate Sleep: Quality sleep is crucial for skin repair and regeneration. Aim for 7-9 hours of sleep per night to allow your skin to rest and rejuvenate. During sleep, your body produces collagen, repairs damaged cells, and balances hormone levels, all of which contribute to healthy-looking skin.
Manage Stress: Chronic stress can wreak havoc on your skin, leading to breakouts, inflammation, and premature aging. Practice stress-reducing techniques such as meditation, deep breathing exercises, yoga, or spending time in nature. Find activities that help you relax and unwind, and prioritize self-care.
Exercise Regularly: Regular physical activity promotes healthy circulation, which delivers oxygen and nutrients to the skin cells. Exercise also helps to reduce stress, balance hormone levels, and improve sleep quality, all of which contribute to radiant, glowing skin. Aim for at least 30 minutes of moderate-intensity exercise most days of the week.
Exfoliate Weekly: Exfoliation is the process of removing dead skin cells from the surface of the skin, revealing smoother, brighter skin underneath. Use a gentle exfoliating scrub or chemical exfoliant 1-2 times per week, depending on your skin type. Avoid over-exfoliating, as this can lead to irritation and sensitivity.
Moisturize Daily: Moisturizing is essential for maintaining healthy skin barrier function and preventing moisture loss. Choose a moisturizer that suits your skin type (dry, oily, combination) and contains ingredients like hyaluronic acid, glycerin, or ceramides to hydrate and nourish the skin.
Limit Makeup Use: While makeup can enhance your appearance, wearing it every day can clog pores and contribute to skin issues like acne and irritation. Whenever possible, opt for a minimal makeup look and choose non-comedogenic products that won't clog pores. Make sure to remove makeup thoroughly before bedtime to allow your skin to breathe and regenerate overnight.
Practice Good Hygiene: Keeping your skin clean is essential for preventing breakouts and maintaining overall skin health. Wash your face with a gentle cleanser morning and night to remove dirt, oil, and makeup. Avoid harsh scrubbing or hot water, as this can strip the skin of its natural oils and cause irritation.
Seek Professional Advice: If you have specific skin concerns or conditions that aren't improving with home care, consider consulting a dermatologist or skincare specialist. They can provide personalized recommendations, prescribe medication or treatments, and help you develop a skincare routine tailored to your needs.


''',
                        style: TextStyle(fontSize: 13.0),
                      ),
                    ),
                  )
                ])));
  }
}
